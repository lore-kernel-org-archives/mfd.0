Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4F43C062D
	for <mfd@lists.linux.dev>; Fri, 16 Oct 2026 10:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145940; cv=none; b=h2HyS6oNP5ows8KnqFNF041z/EuWf35bzN6rdpbRRG1U3BnI98E3R2TrVIagx8uZNzz6y8nKZIfoAU+czgYnkBiwWvSd34t9kLUtbluDpn+3vkU5ul6XnPMAx34nIfTI/a+ORyyOhcqhMMbEnVE8rYK+x1YDsAeN84B0iXW5dWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145940; c=relaxed/simple;
	bh=89JrsG3+e+A8m2cjgdGJs6J4ya7nZFiHpZyHXFZtDME=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=pBQsCnxPqk96koyymPSO6pVJYFD0hlxc5I2K4EeO5iW+8hrQrRaYwwcBkpejpBiFyN6e/DPc2H4fAGZezLXjhxa8fgbO4H/mAMIMdvCxqBq8Yu2D1MNLWIV+vwR1HjLbbtMmV++NGt4tAi5FF+tkpetOYnG6AyPvHBKtNiYUGG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHqr2FPL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHqr2FPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1B41F000C4;
	Fri, 16 Oct 2026 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792145939;
	bh=JlulOVjY0IOsHPCHgVGDj96mchI74H2h/HfY5/aavkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QHqr2FPL5UF2/0XfzU5Z8RQL7E8DoOEd/S0btAq5+h6Lz9mOv8C3JBA8cAoi+0YPI
	 /wM/BnBBFo+pwxlkKyL/IiBO4i7selvj/flXuBxPatrKvo5Fei6628dQsDaxi2C7+w
	 YE8ioG6DCOLmeBIfEGk67UQ9uNVAafo59k7f3WS/ZX/qq8NzAwxKr9OLr5tQV3zH/T
	 AqjhXJO9Ls8CaJdR3G/sdmtJMEPbVhM6ONRa3NTenJZ8oN1FZ5X8dcITsJxxRqfXlP
	 bhbWyXZgb6+aA431CYZbB1AWwx2T+b3GfP/gm+vhUynGrtIAjkGRGEUVmCQkiqWVNa
	 RpLyveyVXoSBA==
Message-ID: <sashiko-outbox-174149@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] mfd: si476x: queue polling work on freezable
 workqueue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261016100503.2581955-2-yaojiale02@163.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-2-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 10:18:58 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mfd: si476x: cross-device race on static io_errors_count
- [Low] mfd: commit message description capitalization
--

commit 42712fe1738df7fa331aa622d7a9ed0967efc78f
Author: Jiale Yao <yaojiale02@163.com>

    mfd: si476x: queue polling work on freezable workqueue

This commit changes the polling work for SI476x devices to use the freezable
system workqueue. This ensures that the continuous I2C polling stops before
device suspend and properly resumes afterward, preventing transfers after t=
he
adapter has been suspended.

>     mfd: si476x: queue polling work on freezable workqueue

[Severity: Low]
This isn't a bug, but the MFD subsystem requires capitalizing the descripti=
on
after the subsystem prefix. Should "queue" be "Queue"?

> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index 9bce720a0a082..8d952113f8a6f 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c

[ ... ]

> @@ -97,8 +98,8 @@ static int si476x_core_config_pinmux(struct si476x_core=
 *core)
> =20
>  static inline void si476x_core_schedule_polling_work(struct si476x_core =
*core)
>  {
> -	schedule_delayed_work(&core->status_monitor,
> -			      usecs_to_jiffies(SI476X_STATUS_POLL_US));
> +	queue_delayed_work(system_freezable_wq, &core->status_monitor,
> +			   usecs_to_jiffies(SI476X_STATUS_POLL_US));
>  }

[Severity: Medium]
Will this polling work cause regressions if multiple si476x devices are pre=
sent?

Looking at si476x_core_i2c_xfer(), which is called during the polling loop =
to
check device status:

drivers/mfd/si476x-i2c.c:si476x_core_i2c_xfer() {
    ...
	static int io_errors_count;
	int err;
    ...
	if (err < 0) {
		if (io_errors_count++ > SI476X_MAX_IO_ERRORS)
			si476x_core_pronounce_dead(core);
	} else {
		io_errors_count =3D 0;
	}
    ...
}

Because io_errors_count is static and accessed without locking, won't
concurrent I2C transfers from different devices race to modify it?

A successful read on one device could falsely reset the error count for a
failing device, preventing it from being pronounced dead. Conversely,
concurrent errors across multiple devices could accumulate together and
falsely trigger si476x_core_pronounce_dead() prematurely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016100503.2581=
955-1-yaojiale02@163.com?part=3D1
