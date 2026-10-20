Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522489;
	b=3VKdIsDJYZ5NJO/LCIu6t7fBGg3ozV/vPegZ1AIE0I0Rb2KOJopcAeZpIGmuU+IhFWvf
	 tqbBbmnrw1bMi2B76OLpmYTuK1LJHL0Q2wDxDIEevJyIARZvRydtWw/gaDNdv3VWE6QnT
	 kzx7NrF3LY+iiFJ/fbwwAMLq2ccTVh1sLmDyrS57cfzIcp4FdVGuqfH+zLKGNXlxE/Sld
	 PyOHoTmRXmTS796SVqnVpRCRv+xrOi4ws65vngKaCtP41UUR0wzYvSvbraBJN06L5fcD3
	 yzZI1XCYdr48aj1KPCpS3vDTd/XEUhJwVYs0eqG6QDSie1eSIG6mxalAGI2Y0EgEPuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
	b=nr7XJYnV5MA2h+Egbkcycn4IFeEcA5KMOsICL5goGXDxzEO/Lyqx7OrwH13E0NsbrRTx
	 86cAgUz3gRUU+vxfxhZb6kZPSw/mFaO56WR3epezBM2VwFfz5z9xJneGyziyBTgI7ri+H
	 sepAwfeh6M+Vkn0nlbCbtiui6GzIOul2M1XFl3TFSilvwhpdQ9K2n9I8ryMjXULi+Ck+6
	 zdlJz+WyXB9YU/p5Z7TbJ3OcgkSVwXSvCU4KcrzY6ix1xd+e4KVy76aTkUUgR1jWwpfoE
	 c51Y1uu3XKoJAeI7PX73TcokbtwnbZd5nkudbGCgUvT6f4w81A5V8wc5zZAS3h+YZtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mz4h9Bi0;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35904606A31B
	for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 18:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35904606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mz4h9Bi0
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so1399759eec.0
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792522488; x=1793127288; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=Mz4h9Bi0cuD5oiuNkMzOzeX+Ro93nmwHPAu7t2b742XgIpMfoeub9y1tOhGU3hKsNW
         lmxuQA8Bch8y8S1bnYnHDmSBaZqzMNf66B1A6IZC2QXjykKOqUcwaJ+tZnWnke4UsPg2
         6INN2AUgteJ+X8X/1vPCLEiWC9zGH0ZUyV/9fvjlRBa1J0GJldvfgq7KWAgj6PobuRts
         6XtRpsi+kaJ0sblaemTs4X2OShc4GcCGO1u7+J2hx9wxafpZ64W4geL35GQuP0NjmcS/
         R80tefOgYn1/1PbHfKJ1/HVn2GsOUBfzVbfuWhfy8OJjg9+v1QiBOhq3RYo2PnVS58rc
         Bw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522488; x=1793127288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a+YGUJeEL21flQxeJgEyROLOEEmxFMPwen0F3bt91wI=;
        b=nL7hFa91UO9rymhohG+PON9AdB67bWYn+0xrpoIWJ/G/M/eb8BLtbHhVWVTNrcZMnf
         ZTEDQO4r3SRSQjXjq6U+uZnzZLypYCnUIfbfAIfkFIKgdzEmXjqHT3KDkVhaMqfOITqE
         3yCwxsU0T+KJYQ+7Fa0+FnStDLXeFwXAmpf/tjIPvnEWm1A676qIcIvGV9pLaBcfXXw2
         jS28wuMb+z4T55nQSTygMoyCzppQG2eEWVE0umgNF0VkFJ7fzdz5YVvJg+KZlSFC6/33
         Qyy30P5kW17PKR4RuUFPBOntI1otmQWkFP3+owlxGrfsukYptR08cz9FlQzXy0misL5w
         bmCw==
X-Forwarded-Encrypted: i=1; AKwUvBzeCiW7qNqDrjbqWltnog7A93kVyufTqqswbtDSws+nIoHVOjG9Xb8cXjmPH0aICGLeuUA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKS8suyx714Pm+b1K0kUiyEpVSXJ7xAY8FkfuXqfQq8iW3v+R2e
	ebpUNWVIHZaG0zT+YUSVnz1t11LEhfE0K5h31hrdUUbpJrYLzjB+mJL0
X-Gm-Gg: AYBFou32xYhoURRKFGx0iRzd7pHjZb3X8kaHlZzWPF5cn3U/1hv6aaDUoz+xD5C7+FC
	/v66vXJJiRGvooqNa8sTHJjKP3k+yzLN1YiGQ2W/lgJ/q8SWL/Um587a5GzjaoAQkKuRcggy9l2
	9nxJrwxmKf+XXFj7fA4yyxpPnDnNXMO3Xawk8k5Lqxsa/eagB78em9dfUvv3N0OcnhHjr4IK4dt
	cM6jXYCoB62d72bdlUHEr61K69bOQlE7JLKOZUoS1gdB89o5rk+JtrxTYrVEPRJ3iSBzrdy/F9m
	PAaUsvZdHwywtWMibzqQqWo/1C8ZuLN8SmEX2kjLgYpP3rQvR0aF/Br8wQ+gDKtICidXn9K8w3o
	UVY0V0LzvPLgkzFDtE4jyzPQMprEf5km1ckOj9DQbX7RggI8PxAG4wGzcbok9n2ngEKNrH5XCRH
	gXvGpzjvmg0yw+Z0XXh9biTCwP1mBFi/N2VPGSGCCsRM9PRUrRKPeerKa/vYvvDmXh0KMRQ0/ac
	lwmX2iHno/GlocoE1OLwAqnK59tXm1na0ZnqeME
X-Received: by 2002:a05:693c:6382:10b0:35c:de00:93d3 with SMTP id 5a478bee46e88-3674f6143a2mr134088eec.40.1792522488031;
        Tue, 20 Oct 2026 11:54:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ed2absm606896eec.5.2026.10.20.11.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:54:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:54:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Message-ID: <ate3WJz8gg9LUG9u@google.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-5-clamor95@gmail.com>
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
In-Reply-To: <20261019100406.103687-5-clamor95@gmail.com>

On Mon, Oct 19, 2026 at 01:04:03PM +0300, Svyatoslav Ryhel wrote:
> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
> 
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> +
> +static void asus_ec_keys_setup_keymap(struct asus_ec_keys_data *priv)
> +{
> +	struct input_dev *dev = priv->xidev;
> +	unsigned int i;
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(priv->keymap) < ARRAY_SIZE(asus_ec_dock_ext_keys));
> +
> +	dev->keycode = priv->keymap;
> +	dev->keycodesize = sizeof(*priv->keymap);
> +	dev->keycodemax = ARRAY_SIZE(priv->keymap);
> +
> +	input_set_capability(dev, EV_MSC, MSC_SCAN);
> +	input_set_capability(dev, EV_KEY, KEY_UNKNOWN);
> +
> +	for (i = 0; i < ARRAY_SIZE(asus_ec_dock_ext_keys); i++) {
> +		unsigned int code = asus_ec_dock_ext_keys[i];
> +
> +		if (!code)
> +			continue;

Nit: this check is not needed, input core will remove KEY_RESERVED (0)
from the keybit when device is registered.

> +
> +		__set_bit(code, dev->keybit);
> +		priv->keymap[i] = code;
> +	}
> +}
> +
> +static int asus_ec_keys_probe(struct platform_device *pdev)
> +{
> +	struct i2c_client *parent = to_i2c_client(pdev->dev.parent);
> +	struct asusec_core *ec = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct asus_ec_keys_data *priv;
> +	int error;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->ec = ec;
> +
> +	priv->xidev = devm_input_allocate_device(dev);
> +	if (!priv->xidev)
> +		return -ENOMEM;
> +
> +	priv->xidev->name = devm_kasprintf(dev, GFP_KERNEL, "%s Keyboard Ext",
> +					   ec->model);
> +	priv->xidev->phys = devm_kasprintf(dev, GFP_KERNEL, "i2c-%u-%04x",
> +					   i2c_adapter_id(parent->adapter),
> +					   parent->addr);
> +
> +	if (!priv->xidev->name || !priv->xidev->phys)
> +		return -ENOMEM;
> +
> +	asus_ec_keys_setup_keymap(priv);
> +
> +	error = input_register_device(priv->xidev);
> +	if (error)
> +		return dev_err_probe(dev, error,
> +				     "failed to register extension keys\n");
> +
> +	priv->nb.notifier_call = asus_ec_keys_notify;
> +
> +	error = blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error)
> +		return error;
> +
> +	ec->ext_keys_enabled = true;

I think this block (after input_register_device()) can go into open()
method for the input device.

> +
> +	return 0;
> +}
> +
> +static void asus_ec_keys_remove(struct platform_device *pdev)
> +{
> +	struct asus_ec_keys_data *priv = platform_get_drvdata(pdev);
> +	struct asusec_core *ec = priv->ec;
> +
> +	ec->ext_keys_enabled = false;
> +	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);

And this into close().

Thanks.

-- 
Dmitry
