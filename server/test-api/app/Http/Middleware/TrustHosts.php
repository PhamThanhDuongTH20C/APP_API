<?php

/**
 * A Training Project
 * This file is part of RiverCrane's project.
 * (c) 2020 RiverCrane Corp.
 *
 * @copyright 2020 RiverCrane Corp.
 */

namespace App\Http\Middleware;

use Illuminate\Http\Middleware\TrustHosts as Middleware;

class TrustHosts extends Middleware
{
    /**
     * Get the host patterns that should be trusted.
     *
     * @return array
     */
    public function hosts()
    {
        return [
            $this->allSubdomainsOfApplicationUrl(),
        ];
    }
}
