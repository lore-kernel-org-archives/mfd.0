Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049573;
	b=g469wWpZ+itHJOlwPsgWqiuzOD0Sqdt0NDdylZ6HrN3bUz7fFD2wmdO8uZ0AepftQgCj
	 iaJHv6IYFiQ4tv8gIHP23aVGfAEQnZ7UlfcxEf32iuwSSe2uPsxCmg5veKQPR9Ao6bEC+
	 5iRYQqj0wZYCdMNCELgunpJgY+AEQhoHKOxbW/esJchQZWqC57RqiQYhXanU95rRt3LW1
	 zeoE/m7GmCIn2+R2ibqxfS6MmUsUo5leNc5TgoheBHdHOw2f1BeEQwrZCg2PP3uihHYWe
	 +MSKrQGJKEnWWHlW0z6v47mXtXkhTSP59FwE6zLRyfZ0zaJspaJbx1KnqdEmV/77MjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049573;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UG+kev6sv6bJydTreZxT+p4tWO+j9O42mYRD9kAExIc=;
	b=nsFOf0OhmQmxXFraIPOD4SSEsFQVBrwZ3JOf8vyFr9Mgll1aFotFv4fWCKMw7xm8+LhG
	 DzcvLdjYHToXf1cm30hdAbNt5VN9sUu4YTYTLJpx8h+Y/B+0txVmVZlGSbyDJwml9RISi
	 AAhqz5F73zAjsBkbQOjNPBb4ce9SWpJ2jDHQy/ICT209rzwtFDlkubIfSrkWYYcIRBO6m
	 a19mehuu7Ri76bTqLbwzSBRaDtNkoi/kXHHEWDm3SoYp5hZeqaEsUCsB9oOyl6nCP7L0A
	 0E8knDxIk11SLTHClxWRTB62GWIzOnHQSyqP+TxDjzI1xwNmOrbBA7MwU9k1Z9j16Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UMyq5Iuq;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0863606A337
	for <mfd@lists.linux.dev>; Sat,  7 Nov 2026 11:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0863606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=UMyq5Iuq
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xPeFJ-00000002S1Z-0Kew;
	Sat, 07 Nov 2026 12:06:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UG+kev6sv6bJydTreZxT+p4tWO+j9O42mYRD9kAExIc=; t=1794049565; x=1795259165; 
	b=UMyq5Iuq/h0gbw1iLP1kfErScI+tjG1WDgUVVeGnnbdu/degh1HFMNW2lsrUQFouVEGiSd64ZAa
	XpoiO8EN43HQeKiIQ/GHdmx5YETkBxBXbfm3hA3QQECH7LePgmq5IluB96z1t5Y7uoRuK1+vhZ8i2
	7mPXUY4Misu6w3DpXHblsbwbz+IROecg7kkS/ln8ECfeLTtVYmRSFPCo1q3/Xs+IHlxmSuHw0MCkO
	BSUuQiKvVpJfOCnqsrihvoQ3dCSkhTkK9GAHtf9iLPL8rb2kU2wyW0WwcH11JKKUwscTOxqCM/piO
	hDQP8A3wJiFF7xf80HZnZmrMecoQ/ygiCuLg==;
Date: Sat, 7 Nov 2026 12:05:59 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Myeonghun Pak <mhun512@gmail.com>, Kai Svahn
 <kai.svahn@nokia.com>, syed khasim <x0khasim@ti.com>,
 linux-omap@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl-core: Reset twl_priv using
 devm_add_action_or_reset()
Message-ID: <20261107120559.50c33c09@kemnade.info>
In-Reply-To: <20261105110332.1874728-1-lee@kernel.org>
References: <20261105110332.1874728-1-lee@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Nov 2026 11:03:23 +0000
Lee Jones <lee@kernel.org> wrote:

> Register a devres cleanup action immediately after allocating twl_priv
> with devm_kzalloc() so that twl_priv is automatically reset to NULL just
> before its underlying memory is released on probe failure or driver
> unbind.  This removes the need to manually clear twl_priv in both
> twl_remove() and the probe error unwind path.
> 
> Suggested-by: Andreas Kemnade <andreas@kemnade.info>
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/twl-core.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index 21fc0acb827b..6077a87282f5 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -711,7 +711,6 @@ static void twl_remove(struct i2c_client *client)
>  		twl->client = NULL;
>  	}
>  	twl_priv->ready = false;
> -	twl_priv = NULL;
>  }
>  
>  
> @@ -728,6 +727,11 @@ static const struct mfd_cell twl6032_cells[] = {
>  	{ .name = "twl6032-clk" },
>  };
>  
> +static void twl_reset_priv(void *data)
> +{
> +	twl_priv = NULL;
> +}
> +
>  /* NOTE: This driver only handles a single twl4030/tps659x0 chip */
>  static int
>  twl_probe(struct i2c_client *client)
> @@ -776,6 +780,10 @@ twl_probe(struct i2c_client *client)
>  		goto free;
>  	}
>  
> +	status = devm_add_action_or_reset(&client->dev, twl_reset_priv, NULL);
> +	if (status)
> +		goto free;
> +
>  	if ((id->driver_data) & TWL6030_CLASS) {
>  		twl_priv->twl_id = TWL6030_CLASS_ID;
>  		twl_priv->twl_map = &twl6030_map[0];
> @@ -906,10 +914,8 @@ twl_probe(struct i2c_client *client)
>  	if (status < 0)
>  		twl_remove(client);
>  free:
> -	if (status < 0) {
> +	if (status < 0)
>  		platform_device_unregister(pdev);
> -		twl_priv = NULL;
> -	}
>  
>  	return status;
>  }

