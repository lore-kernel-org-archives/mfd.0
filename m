Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798084;
	b=UzkC2qZWe94FMOsV5ATGz25wWvKu6QbX+QQwfnJjl0c9vuRDbxRp76vqWdRoOmzHw3l9
	 V8iCgN1niqEGcrJ00J/redPtbClBPTOPUzTB4a7bRWBnB4Zhu7ZV1ItFERBrr8pFHMeYn
	 tB+WCImXk2ONQN76dQbbf6KGyC00wWawTwvTX25WN+SC5oAFVp1AWq/HFhpHaWBMohwCw
	 st2CPaB3c+kpSWc94EqVqRLqg4TDKws8i4Fp4vULageb7HU1yxtqku72s3SmbuymwlWMA
	 RmpJEL5jEDDhsCVrbflNNqRdwX3BBCp2YpidPmgGSAI8mLXA2yk0ZVyN83iYIgfXbfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798084;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=avIhIoNlAin5Bl3LtM3GHZzSeYob9XWik0nmD8qywVk=;
	b=n2fqncjxRQrqi0D2CRK1TYjqYmwyUGkH2eTmWTTpucY8tLM2dQD9JEq0nihHbgrJpt/w
	 gGd1k4/ltEm1r4KCkEJgXyQuzvNNck5XMWuEY/8i6i5XfwYNY3BTN5TQEuTC3IvcJH1aS
	 1NRD0NXDhx075tPnL/lZgtEnfY07wTv03VnX2dP6SHWpQ+/EMztzk7aCOeBmSWtcZ4JZi
	 FXi5TAEbBw3mE8202wvFrWbtw3lqRqvPn7SzR5+rRvdowMUIdbXymQTVscjwpwq6X50vh
	 Z3bGpZ5VImLRRzayqWG27g0vdJAMDeFN+h984bszk9qSNe7rRiSgmY6IyDXmHO1p+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUuSSYiu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A344606A32E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 16:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUuSSYiu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144941F00893;
	Fri, 27 Nov 2026 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798083;
	bh=avIhIoNlAin5Bl3LtM3GHZzSeYob9XWik0nmD8qywVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SUuSSYiugvRyIxgw8Y5LB5HGZkEbdHo6uU1xsVJEdraUyZpWVVNSA1kb2fx8/M0Jp
	 yT3NHNCEbXeQ7IfbrC7qdfi4ZH9ElG5D0ZpQa7hwkTXMAZ8LcBDHAPbx4eIpuFUDpP
	 X6R6hGgUAuuQtrjhbSmmFqeVVtWE7xTkfJXJ68KcvHv33odVP0I/X5wE51SjlgUKTq
	 6enpeDiPP+mUrpRz/BkfChvoI69+4kR8r8d0quIlc/uUYM4E/rGbOoaIdzk3Cge6er
	 5VVfHRs3wXImPfteQtEgu2vqlfrKlkoAXFkFMobKNcjLiw+DFE5P5jzlVxrbWwVpZd
	 9YI6Vtq9voyIg==
Message-ID: <sashiko-outbox-237928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/6] mfd: max8907: Add restart handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261127164044.285910-5-clamor95@gmail.com>
References: <20261127164044.285910-1-clamor95@gmail.com>
 <20261127164044.285910-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:48:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] mfd: max8907: sleep in atomic context in max8907_power_off()
  [1]
--

commit 3ff678ec45fb0fff7c90331a76083a6b71a149d3
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: max8907: Add restart handler

This commit adds a restart handler for MAX8907 to trigger a hardware soft
reset via MAX8907_REG_RESET_CNFG on system reboot.

> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index f6eeefb419622..b511c57026188 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -185,6 +185,16 @@ static int max8907_power_off(struct sys_off_data *da=
ta)
>  	return NOTIFY_DONE;
>  }
> =20
> +static int max8907_restart(struct sys_off_data *data)
> +{
> +	struct max8907 *max8907 =3D data->cb_data;
> +
> +	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
> +			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
> +
> +	return NOTIFY_DONE;
> +}

[Severity: High]
This problem wasn't introduced by this patch, but can max8907_power_off()
(and max8907_restart()) sleep in atomic context [1]?

System power-off and restart handlers run in atomic context, whereas
regmap_update_bits() on max8907->regmap_gen acquires a sleepable mutex and
performs sleeping I2C transfers, which can trigger a sleep-in-atomic bug or
hang the system during shutdown.

[1] https://sashiko.dev/#/bug/linux-01ccb5e5-8cd7-47b3-81d8-f6c05e2ca293

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127164044.2859=
10-1-clamor95@gmail.com?part=3D4
