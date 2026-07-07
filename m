Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9442EA173
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411970; cv=none; b=AaUfyL/JWIAkpc6htZqn2snFFk581puccghtf2HjpILPywGIgrAqgQ2ZRNtLaSycJ/DEx5pMoHIjuEGPQcrcVbX/SngQJgFB8XKiFrl9ZTUS6w6iSRsK38zpi8dDKWYCSAJz3bCPHhFXdLqXh/ywyu7owwHTQEVBJhvrUoU/TXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411970; c=relaxed/simple;
	bh=3/6Jl/KEuHkZgDKmIRWarfdKkNEmWgX+wMgzG7MxDOg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AB7i7ZxYLlPoutmHEd/2ak1130nUHuC5ZpLMEPD/DhMHXaq8uxaeK6d5EL8aHp2v99ylETd8xpACpU2inzamEl5HwOvfYfEOUz27hi6zl9jp12QfHU8diaTHTP/y+mWxsv0nh1kUE6Y4K1ezBUa8xo1mEhA36+WKsuz+Wkmcs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uvm67YDs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uvm67YDs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE541F00A3D
	for <mfd@lists.linux.dev>; Tue,  7 Jul 2026 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411969;
	bh=qyXhAoha/AZcU7nsd7YHmCPypIPBLtZX2DVEc9k2wao=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Uvm67YDsKFwLhJslmiHQtoLpZthdfYQt9LK1ANDZBC81hsiWNecwGptq0lC6Ls8or
	 +avNGDnnNjICc3BqME4VL8O2s5DTv00GW7Zk6X5PzWimGYshXRRIvgXtb7FxBiwBft
	 iIRo0vNOA2EWMRHWYEw6XO5yHJIBWAB6j7aPWYvr6GFftjTM3zJ6X9NHnVOz7m1w9m
	 GHgQ9mgturzmqweDrvzlghCG2ueE6swrwzYlTGgDDaMvAyWo6N23hRGsvmDbqFnser
	 Nf0Ken/nWmmCsJdhMKZOL9wr/39j78F6DCHHGfsLM8sBRCuhb9V8sSFjIKwcOhG7im
	 voh3S1lpxEqfw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b237fb695so34131791fa.2
        for <mfd@lists.linux.dev>; Tue, 07 Jul 2026 01:12:49 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywhy7AIsKiKr4ITpbhWKXzMeQIc9TicGsWc8Z9k4IAqiOs9P48e
	mB6YzJMXhxbYNOkLP1gg8KfyjURlnR/aIAQpm08fOelCbGbR+13Q+Pfq8gXe8zAfmrXSYCFrY5M
	ZiBTnk4QhHlvoxDDFJG0EsF2SgmgW9f7JjL3LQFuAMA==
X-Received: by 2002:a2e:908b:0:b0:396:7a05:6eb0 with SMTP id
 38308e7fff4ca-39c5fd7ddb0mr7500621fa.2.1783411968026; Tue, 07 Jul 2026
 01:12:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:12:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 01:12:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-ucb1x00-assabet-swnode-v1-1-6102eabd31d0@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-ucb1x00-assabet-swnode-v1-0-6102eabd31d0@gmail.com> <20260706-ucb1x00-assabet-swnode-v1-1-6102eabd31d0@gmail.com>
Date: Tue, 7 Jul 2026 01:12:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdQQ_-wPPNQ+e02HweKvAhzDjev7++SH2ud82s6EDNVqg@mail.gmail.com>
X-Gm-Features: AVVi8Ceof5tDW-3znf6zSsPV4rYjwPUC03l_urY8Kk8u_JJUjKQEEDOsGWQjqf8
Message-ID: <CAMRc=MdQQ_-wPPNQ+e02HweKvAhzDjev7++SH2ud82s6EDNVqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: ucb1x00: register software node for GPIO controller
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jul 2026 01:08:04 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Define a static software node for the UCB1x00 GPIO controller and attach
> it to the core MFD device in ucb1x00_probe(). This node will also be
> used by the created GPIO chip.
>
> This allows machine subdrivers (such as Assabet evaluation board
> support) to reference the UCB1x00 GPIO controller in property entries
> when converting legacy platform data to software nodes, resolving pin
> bindings directly via the attached firmware node without relying on
> name matching.
>
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/mfd/ucb1x00-core.c  | 12 ++++++++++++
>  include/linux/mfd/ucb1x00.h |  3 +++
>  2 files changed, 15 insertions(+)
>
> diff --git a/drivers/mfd/ucb1x00-core.c b/drivers/mfd/ucb1x00-core.c
> index 16f64e2b2f77..8d1c34c53955 100644
> --- a/drivers/mfd/ucb1x00-core.c
> +++ b/drivers/mfd/ucb1x00-core.c
> @@ -25,8 +25,13 @@
>  #include <linux/mutex.h>
>  #include <linux/mfd/ucb1x00.h>
>  #include <linux/pm.h>
> +#include <linux/property.h>
>  #include <linux/gpio/driver.h>
>
> +const struct software_node ucb1x00_gpiochip_node = {
> +	.name = "ucb1x00-gpio",
> +};
> +
>  static DEFINE_MUTEX(ucb1x00_mutex);
>  static LIST_HEAD(ucb1x00_drivers);
>  static LIST_HEAD(ucb1x00_devices);
> @@ -530,6 +535,10 @@ static int ucb1x00_probe(struct mcp *mcp)
>  	ucb->id  = id;
>  	ucb->mcp = mcp;
>
> +	ret = device_add_software_node(&ucb->dev, &ucb1x00_gpiochip_node);
> +	if (ret)
> +		goto err_swnode_add;
> +
>  	ret = device_add(&ucb->dev);
>  	if (ret)
>  		goto err_dev_add;
> @@ -604,6 +613,8 @@ static int ucb1x00_probe(struct mcp *mcp)
>   err_no_irq:
>  	device_del(&ucb->dev);
>   err_dev_add:
> +	device_remove_software_node(&ucb->dev);
> + err_swnode_add:
>  	put_device(&ucb->dev);
>   out:
>  	if (pdata && pdata->reset)
> @@ -630,6 +641,7 @@ static void ucb1x00_remove(struct mcp *mcp)
>
>  	irq_set_chained_handler(ucb->irq, NULL);
>  	irq_free_descs(ucb->irq_base, 16);
> +	device_remove_software_node(&ucb->dev);
>  	device_unregister(&ucb->dev);
>
>  	if (pdata && pdata->reset)
> diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
> index ede237384723..214c71a12e84 100644
> --- a/include/linux/mfd/ucb1x00.h
> +++ b/include/linux/mfd/ucb1x00.h
> @@ -103,6 +103,9 @@
>  #define UCB_MODE_DYN_VFLAG_ENA	(1 << 12)
>  #define UCB_MODE_AUD_OFF_CAN	(1 << 13)
>
> +struct software_node;

Like I commented elsewhere, my preference for forward declarations is to have
them right under the includes but I won't die on that hill.

Bart

> +extern const struct software_node ucb1x00_gpiochip_node;
> +
>  enum ucb1x00_reset {
>  	UCB_RST_PROBE,
>  	UCB_RST_RESUME,
>
> --
> 2.55.0.rc2.803.g1fd1e6609c-goog
>
>
