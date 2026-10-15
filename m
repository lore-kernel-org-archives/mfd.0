Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C970272E6D
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 01:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028314; cv=none; b=qjangwugqcfpNTzLHY6e7NW07U5wtWpWvJu9BnCdULZu6g9KfZywglnRCRsdu8QV3Lc0nBKvcoX/SP9dvnbVND8MK+Vy29ql6iyGtuNKn8IGVr2ecJmuQSSFILJaLq6BNplF/UHWY7lUgvwqtiVsRaOWfMK/YSSBFmUxJ01sBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028314; c=relaxed/simple;
	bh=/Qgnut9+G6PGmnCXCHz/0qRV+Pfvr0slJqmidKSXVH8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=mU9Mt+reYtukpICISmT8xYsRrN1+VrtYurIrz7QkM3RmKUXa6DRhVMYOTZ1VptNMEiFVzxFPF2a5IgR63HMFO5PQRexzRHZqhxf5hy+zGSDzicRhc6P/MJrIPwg8RfjWvnVKy823uiGn6y7HNuSQSS1TJwaBnrMUG8a8fUsxk/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIrNVZ9J; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIrNVZ9J"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3514b90bb89so2647703eec.1
        for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 18:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028312; x=1792633112; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biVi8aFmQp7Egr8jmIyP2HiGBUC9LJELcNuVslQ0QHw=;
        b=YIrNVZ9JtaLM5rwzdcLN/kyFTazBHupxBL0eILiytodGVQTWPnU17oe1HefxcazOnh
         TCwy2lw69EwbQoyHtLNNAFX5F3LuGTCNWAeNpiZ+Dr5FwDi0PcnzSNKdwoAXOZMR6+SW
         ugWE/u3Z9gecH2l0KZ6LK20ZDfpZ8sBTpFWhlpnBPokTv+aWRkqp8RPsefx4l6FnrKBd
         7EKtDCDiwkJn5rj/5AmhbrDBRfnIkdG3c4eoBYKg+716urWV3Bs0pmC178cbrdclvCSc
         MH0Q2W4Iio/IJN7iMaoO+tQlN/v5MUefCLB2Lsyu5e48qPRAj/eYaHuhyAQEOC1pYemV
         3P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028312; x=1792633112;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=biVi8aFmQp7Egr8jmIyP2HiGBUC9LJELcNuVslQ0QHw=;
        b=ZtlQ79UP5olS++jJttBEDgfy0bXuoWpsWEQE1HjhrpEv7l+kAQyfatBDBeRTSlXJCe
         B1If4qWmwYY0/+BQ5AZf+SDS9M3jO0+oO17OIHNL3XBer7jQ7wYek1twpzqz2twPiicT
         K0lmV/2nfKG9rPDD0Itt45fijFOPguH4ytnTvcBJYuoiRHhWUMbh4AOkg3bW5q2RB90F
         Czh1UBEr0NFZ9TMF2tuOdSbm008IEcc54ZDbPwbwrr+TfFxQsLjXEhA3/ZhZFV6Zj9+j
         aprSZD3++wjbePsRsxsXCrqi48ZPB0agdPrprn8XlNXGFxQixkNDmsT1X8kK2l2e5mI7
         ruEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmrY56SI+BFPVdzvm7mO2G2MJQE/w4NRWBRjX5Ucg4Du4YAhHXyUDjGRsc/pl/03Iqn2o=@lists.linux.dev
X-Gm-Message-State: AFq9FYLtbLwmFIJ8N7Q4nQpF7NHHRgfpKvTMPvTktO3XBuJ6PGNANV66
	KZ9JdABX9agMos/z8lmGzruLHRsYenVyEVe0LunA6Wf41i0NnmYCTFUu
X-Gm-Gg: AYBFou2JULc11ICbDF26G0iqPesdm7iOn4qOR0BqxxXkZPX9VV6xoiATDbsB7A6IQGB
	z6ESSrPS3ftQI0Ua99kR33n+9hH/58mMS4ySaD83BJ5LYBAOvJjWV5vGxkhaXE4jZtnuC2uZPXC
	PMLderSTWBg10NlCu+FP9y+9nxE9Ya0QdR4xtwvBm65iCtVgDfBFDCBY+LRBiwXKVtDOodoCz5m
	LFPSsyT2tmhDZItx+bLuR3urtI89NSkFkiBSmfSAkPHozZwJcnKKSeeC0dGJ763KspFi/E03LOl
	2JgjvowuUfAYwjWoqt0HlUPSDcgn98e3ZI0t+q0/fAZu8YxSsCHjZvCq/Yo+zKt0+ugsVBNLbJC
	CDP+xUC2ZWYGT28XzmekPvEMbYbuFgbeq+zQdouVOyTVg/dLMeoPqAWOjCUqOKmeely+BUhSsVn
	HbuQrjxcXiG52Rxy2mdUkFrImIe2626i09fWTIme8UyhG5073IPwiF8OfMw82T9+AcHBpPej/U8
	YRmK+7Kp0BPG3EQN2CFRCWwjUWBq1R9mQu8FvfXxuYf3KnZ
X-Received: by 2002:a05:7300:d209:b0:35a:47ed:c39a with SMTP id 5a478bee46e88-35a47edc590mr14634414eec.37.1792028312150;
        Wed, 14 Oct 2026 18:38:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:821:261c:74c2:4177])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm56907491eec.16.2026.10.14.18.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:38:31 -0700 (PDT)
Date: Wed, 14 Oct 2026 18:38:30 -0700
Message-ID: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	=?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Florian Krischer <florian.krischer@fkr.dev>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
In-Reply-To: <20261013173504.451391-7-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Svyatoslav,

On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> +static int asus_ec_battery_get_property(struct power_supply *psy,
> +					enum power_supply_property psp,
> +					union power_supply_propval *val)
> +{
> +	struct asus_ec_battery_data *priv = power_supply_get_drvdata(psy);
> +	int ret;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval = 1;
> +		break;
> +
> +	default:
> +		ret = asus_ec_battery_get_value(priv, psp);
> +		if (ret < 0)
> +			return ret;
> +
> +		val->intval = (s16)ret;
> +
> +		switch (psp) {
...
> +		case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> +		case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> +			val->intval *= 60;
> +			break;

asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
properties >= 0x8000 into negative values.

In particular, when the battery is not discharging or not charging,
TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cast
to s16?

Thanks.

-- 
Dmitry
