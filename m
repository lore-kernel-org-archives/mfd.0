Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C681E44065D
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061689; cv=none; b=ppEhGjsO7DnfLmVBbWkQv+VynBa7I3ClO8g6eCGxnZLpZ84qxz6kx9ooyYxaZk7iOb/nI7iTZtZciQyvYeaPJ8NLmmw59P0xzah5xNWmmFLFOZER2VQA6cXmXSVBRgkGqOcGTU8GFljIo6TMFaR9gEZJyMaKIfLnDv0Ovnv13lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061689; c=relaxed/simple;
	bh=EfLVE4VA6vp11chpTm2OmwU7VSJ/9ob77tWUqOcH7Rk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dIyHlRh7WatPbAvu1pN0J8W2Tlz/CSCQexyAy4riW0/1B0E54cqGktJ+L4JjBkBkRWJ3hCdPc+gg7lR3vpZXKMYMk5LnIqwmlMcmuD3sTL0aI+lfypkICcBw1flr2nYomcbfa2zTJr3OqX3Z1DCdnarfgSCIcV2NTeg7a+9Tt58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etO30S1z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etO30S1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA651F000C4;
	Thu, 15 Oct 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792061688;
	bh=VUdeFoQ4QvlV6gEfNiCBiPv6TeA2C5a+fy9xZUYyyQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=etO30S1zb2adrUMySIPyEz5a3QCxVp+cK7V/DyW1jGh0t8s6Oi/bKDwtS1MPaG3Kr
	 Tci1ZNkx0eEThitAWJGAi557JmzqmFiXibvjLKfQ6AOQYu/xxk9ffzcK4B92HLLbbH
	 3Y+dXZ9WsCcyer+TUjGrHEC8tJinemuMvXpuz6W/zdzhj3EoJrlWb8zkVNLv6YzCVY
	 ImdI2201latfPwPiIlukTgYMB9qNj13E6IIm9ZwmPDs3Cid5mC6w8osVx+UiM4i8cK
	 olRgVNUFv3qxcP4Ntd+JgFA/OaEdP691lSrjncGiByVMSIeGZ7E9epM8mIJu6fDSRU
	 8Xh7J+x8uARsA==
Message-ID: <sashiko-outbox-172688@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] mfd: tps65910: Add restart handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015102320.23760-3-clamor95@gmail.com>
References: <20261015102320.23760-1-clamor95@gmail.com>
 <20261015102320.23760-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 10:54:47 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mfd: tps65910_restart() takes mutex in atomic context causing rebo=
ot hang
--

commit 598e179b25dd180722652303f6d0b1714ad2d8ef
Author: Dmitry Osipenko <digetx@gmail.com>

mfd: tps65910: Add restart handler
   =20
Add restart handler to reset hardware properly on system reboot.

> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
> index 18b76359046b8..a1734fee1485a 100644
> --- a/drivers/mfd/tps65910.c
> +++ b/drivers/mfd/tps65910.c
> @@ -440,6 +440,20 @@ static int tps65910_power_off(struct sys_off_data *d=
ata)
>  	return NOTIFY_DONE;
>  }
> =20
> +static int tps65910_restart(struct sys_off_data *data)
> +{
> +	struct i2c_client *tps65910_i2c_client =3D data->cb_data;
> +	struct tps65910 *tps65910;
> +
> +	tps65910 =3D dev_get_drvdata(&tps65910_i2c_client->dev);
> +
> +	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
> +			   DEVCTRL_DEV_OFF_RST_MASK | DEVCTRL_DEV_ON_MASK,
> +			   DEVCTRL_DEV_OFF_RST_MASK);

[Severity: High]
Does this regmap call attempt to acquire a mutex while executing in an atom=
ic
context?

During system reboot, do_kernel_restart() iterates the restart_handler_list
atomic notifier chain. This invokes tps65910_restart() inside an RCU read-s=
ide
critical section, often with local IRQs disabled by architecture code.

Since tps65910_regmap_config does not specify disable_locking or
use_raw_spinlock, the I2C regmap uses a standard mutex for serialization.

Will attempting to acquire a sleepable lock here trigger a BUG warning and
deadlock the reboot sequence?

> +
> +	return NOTIFY_DONE;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015102320.2376=
0-1-clamor95@gmail.com?part=3D2
