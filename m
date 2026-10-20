Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523051;
	b=cMqHSUH1M3fSE/BHB9d+7B1bwYsQ4BN+zA0EvUojyVs9cw4yrc4TMgWzM3NSywDjJ1Iu
	 Rl5edFPAwCAD5jDNn3+haCSevOfqRvs5A2r2RRs+FIfEc6xMBnypKNNmkbBGXil16Dh8q
	 C5ZoRtcmVQsHN5wVCeFgCyiTC0GU+6JcsWWFkYj9dVmlu8Px3bXiYw75Vm8f8K6duoiJO
	 8q7PLgH7WV46cmkZvRiJL56bv4d2BkGZjE6MebrhlXlHc2RBlVNDGgL9vIBlPKnCaysq8
	 l0X/rQ0AkO5vU/TtBVRrhlPMmRoLqbuRWNXazi9+88H7VsKUJNjjGTCsrpel/ECFb/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
	b=p64opzXccPUcea3nXqYsjDOppN7NzKrL0DEnF5eMEUg1mTkUlRGzolGQAz0RI7UBn14D
	 SEknYxLha7SKLxjPQWOX1b5R1eZFrZAFAIWivnHVf35VVcQitrcQ4tHq39MicylqKMFuV
	 xzzqJ7LgEOBtlz3zaJuqAZ0m2F/DmoN1pI7MZH6pMbZ5RGOzCUVJGP2MSc5BpjoI0hxnX
	 j4uXFNa//rtElQfgONAI9A4SgayNJnBxF6JQwgRuCzfBtgu86hF9jua7bjgJuyYvyiQhe
	 y3S1Y+ktQfcjXH44fEIqHCJBhjdDiF4vZUzZ5p04O9n+2sMN5dclfc2/JuKv4xgMvgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ip8R+lGj;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343AF606A322
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 19:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343AF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ip8R+lGj
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so4511504c88.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523050; x=1793127850; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=Ip8R+lGjHJzNiuHv0DZ66ZQF9pvSsKM/R7mE9Yqvar7RC4fmSnituGuKt7f5lhWjWe
         ASkwkrifDOxVGvp5wV/VnNZcgSvjkRSQT8lc0MXkSN+mo4wC2aXh++JkecLvowDEAfZI
         KEHQWVaAEzoEkYcK3UHt94BhhBd33Dg6eX6zZkrL8m2dOiLcC7v3wrc4pwfCaM+Vhe5Y
         YOOrXPJ3bNnlHUyEsP+k4fD+jedgtl+q7xVb+72azfCvSb6vKqc1c0F1E7tnHFr2P7b2
         CspmRA/9bXhoP+5KxWDzWni/9z39P5LnYB/qJ6K0qFQ3bHNpM3WRO/LHmNIza4M4AJNP
         4Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523050; x=1793127850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7NqznRIlKLn/pELhTMEco0REzkh4v7wlCaqZptITogI=;
        b=OKsca0XhbTyYR4SuQAgmi0007B0qon9KPscQRr+bc9211SPMIihH/w6rENlOqVP7F2
         DVznEYht9XqAuc+v24k5diSqX2R4+wzkQoVHC0zqQz/WLIysaO58tt+PBJXKVfBhDpEv
         GoJeXmWtE4Q2nWWLjkPDXvgEnTfmWl5MIc05d/eAgxEVf0Oyyp3PnQNhCWGWuYZM9rNb
         cyV7kX9/YYoB30cIkTcSLnOIJUdJxJxeeWj91OYvn8GamxNuW7mIrqbdnd0JkBp54gj2
         +0IwBmrlTc74CnLi8nwWGGcubBDgfuJGp6f4iR4cO+NEx6XPIF8ugU8hwuJcVb0yuR0d
         mM0Q==
X-Forwarded-Encrypted: i=1; AKwUvByiOZvILe9dhtGCYvonB/KQmoJDq0ts/Ov3lyBhb+6mN1A2sOBQjA+GCn2//Yaydnjmovw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLYY+BytMmsiMNw5nQjr9woCP14Zyu+ddcAWq8Or9/nN8vfpt39
	QFyZU0dtAQMU0LIV0t+RRzAcZyTit9B5RAXm01vTdxzsbISao/b+AfZy
X-Gm-Gg: AYBFou1NV8oG7WrfJbGgbY0rIrlmAL7XSIbsH4FY5DI+GsNNyT3ktKFcz0tVMTidRFP
	nVni2Zdvp4I71It6IY97gF9EuYbiuEuvts0Ct9Ze85tIFZqoWJq1QnH2DTh36O8sB2Qnkmml97n
	OaBD8gMbHgCMW0/yu3GFhOe58VBkkPRRGgJuG0cpMH6d4GAAG2HLpvzTVgRRuiECeBXQ9f4KJSu
	ayTYNRZg0fqwKMZE08+oJKZoAc4Casx2wVqXOiSJqCV8bOatruLRJEdTykCbxxjMp1dwWLsYYG0
	Riu8fIndOU6uKpHlUPVz4IKsNOOySSTnrov/mpA3kiNaZjt7breVIlV8tK+UT8a8Yziw3HSOWXo
	giFp+Ym5zcCT63kSVpnzhTFgNurZEuj1iEgxAR8A3XuKpU71T5bHJqG2iyQ5MksuMEIYh9JKzUq
	Tu2eSJ0/bSmcrZdtzWj5xfI2JmJlOwpKRS0RjVoXfKyJDVTWNW1JvRvWdowiMZmKLvpZmNnAeGE
	isKx8b6QgycQuw42OJANgaVmAoUZ/i3/Uh1uhYtgRhqxpdkq8k=
X-Received: by 2002:a05:7022:e804:b0:13b:3132:6e99 with SMTP id a92af1059eb24-18512c38164mr17695167c88.20.1792523049985;
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm552320c88.9.2026.10.20.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:04:09 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
Message-ID: <ate5K6ZdrSoBUI08@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-4-clamor95@gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019100406.103687-4-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add input driver for ASUS Transformer dock keyboard and touchpad.
> 
> Some keys in ASUS Dock report keycodes that don't make sense according to
> their position, this patch modifies the incoming data that is sent to
> serio to send proper scancodes.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +static int asus_ec_kbc_probe(struct platform_device *pdev)
> +{
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct asus_ec_kbc_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->ec = ec;
> +	priv->parent = to_i2c_client(pdev->dev.parent);
> +
> +	error = asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> +	if (error)
> +		return error;
> +
> +	error = asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_AUX_SEND);
> +	if (error)
> +		return error;
> +
> +	priv->nb.notifier_call = asus_ec_kbc_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return dev_err_probe(&pdev->dev, error,
> +				     "failed to register blocking notifier chain");

I think sashiko is right that we need to register the notifier first,
and in it check if serio ports are ready/registered or not. For that we
probably need a lock and set pointers or flags in serio's start()/stop()
or open()/close() methods.

This can be done as a followup I think.

Thanks.

-- 
Dmitry
