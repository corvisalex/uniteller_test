<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    private $conn;

    public function __construct()
    {
        $this->conn = DB::connection();
    }

    public function index()
    {
        $userId = auth()->user()->getAuthIdentifier();
        $userLogin = auth()->user()->username;
        if (!empty($userId)) {
            $table = $this->conn->table('user_balance_history');
            $sums = $table->select(DB::raw('sum(case when trans_type = \'PAYOUT\' then concat(\'-\',amount)::numeric else amount end) as balance,currency'))
                ->where('user_id', $userId)->groupBy('currency')->get();

            $data['login'] = $userLogin;
            $data['balance'] = $sums;
        }

        return view('home.index')->with('data', $data);
    }

    public function ops()
    {
        $userId = auth()->user()->getAuthIdentifier();
        if (!empty($userId)) {
            $table = $this->conn->table('orders');
            $ops = $table->select()
                ->where('user_id', $userId)
                ->where('type','=','pay')
                ->where('status','=','success')
                ->orderBy('id', 'desc')->limit('5')->get();
            $ops = json_encode($ops);
            print_r($ops);
            die;
        }
    }
}
