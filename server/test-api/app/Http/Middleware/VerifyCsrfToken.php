<?php

/**
 * A Training Project
 * This file is part of RiverCrane's project.
 * (c) 2020 RiverCrane Corp.
 *
 * @copyright 2020 RiverCrane Corp.
 */

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array
     */
    protected $except = [
    ];
}
