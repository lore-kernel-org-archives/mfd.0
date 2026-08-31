Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3471C4446EC
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 17:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198707; cv=none; b=NB8LckAJsCFnVjGpVoVlyHAVrAaWNoH7iLoXKCcWfEcmVhVCGDkK1GZmi3FuTJ6FTvIsGkm31fGKqQoJkePCRJabNomD2Pos0oG1AVopmoUa6m//3VgH8r82uOgfUS5ulYpoEXxVTHFNFykltEXJoYmiZLakZTeU7nAnfKh+t2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198707; c=relaxed/simple;
	bh=uZJpNJu/KltXm9h+8tBxwfbh4UkiKvNMJs5v4WWOuzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pj3CiF+M6wZRvbAC3r7YDEKHW3SH/GrrGf9RvJkyV+Xl1FomrzAvBxWXTbkTlvORnx68icElSSsRtzp5bq/F2WRXgRH1rEUb68DzZKeeke7cpCbykzoZW+HnunvYDegCm/+e44FVdRMR3I8Lr2GsAdM8A8Yo0utnNkV9Y846tNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhX9fLcx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhX9fLcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD581F000E9;
	Mon, 31 Aug 2026 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198705;
	bh=gEOvWyZzl79nLt5HJfaWHe1T10DbAa2Z7YTmPKyHQtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MhX9fLcxPpW66PzbT/bv1pTf+BdlyqzhVNuYAT1PMQh60tMFsJCuqwpwSgMLXEjOa
	 qnC8ydrb7Tjk1Ht2nT/yD3U0cpRxMfiSgYbHVoMCb4nX6V9eNWeukPq08IL506fexz
	 njOL/OIZId3OEDYzCs27dkxsLmG1AXhhBdZukVu1Q/bK6rEJO7yAld+qwQ00f02Hm0
	 MjchyB9vgPUYN9vOOsciu9mcrRcCN3g6K+ea1BcblCcMQVLvaunY1K6oON9bT+FvI3
	 ATqRqa6Q6K1I+9tdLfpCQ23eXwPhWD8da6e8rFArq9DGAq4jAyPXCxJzaGJqCAgUIg
	 g4D5BDwgt+FzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] soundwire: Add a helper function to indicate a
 device will detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>
References: <20260831140157.1736905-1-ckeepax@opensource.cirrus.com>
 <20260831140157.1736905-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:51:45 +0000
Message-Id: <20260831175145.9CD581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Lockless modification of `unattach_request` and `reinit_completi=
on()` in `sdw_slave_signal_unattach()` races with the SoundWire bus core's =
`complete_all()` calls.
--

commit ce5e6d376d5f35e5d6e355828851eabcbe943488
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

soundwire: Add a helper function to indicate a device will detach

This commit adds a helper function for drivers to indicate they are about to
initiate an action causing the device to detach, which reinitializes the
peripheral completions.

> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 707ca6bd1e23d..7d41df30561cf 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
[ ... ]
> @@ -1214,6 +1221,25 @@ static inline int sdw_update_no_pm(struct sdw_slav=
e *slave, u32 addr, u8 mask, u
> =20
>  #endif /* CONFIG_SOUNDWIRE */
> =20
> +/**
> + * sdw_slave_signal_unattach - Signal that the peripheral is about to de=
tach
> + * @slave: Pointer to the SoundWire peripheral.
> + *
> + * Inform the core that the peripheral is about to detach from the bus, =
this
> + * is usually due to some implementation defined reset mechanism. After =
this
> + * sdw_slave_wait_for_init() should be called to wait for the device to
> + * return.
> + */
> +static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
> +{
> +	if (!slave)
> +		return;
> +
> +	slave->unattach_request =3D SDW_UNATTACH_REQUEST_SLAVE_RESET;
> +	reinit_completion(&slave->enumeration_complete);
> +	reinit_completion(&slave->initialization_complete);

[Severity: Medium]
Could this lockless modification of completion variables race with the
SoundWire bus core?

If a slave driver calls sdw_slave_signal_unattach() to initiate a soft reset
concurrently with the SoundWire bus master processing an asynchronous status
change (such as a bus bounce):

CPU1
sdw_slave_signal_unattach()
   reinit_completion(&slave->initialization_complete);

CPU2
sdw_handle_slave_status()
   complete_all(&slave->initialization_complete);

If CPU2's complete_all() runs immediately after CPU1's reinit_completion(),
the completion variable is marked as done.

Will a subsequent sdw_slave_wait_for_init() by the driver return immediately
instead of waiting for the device to re-attach, causing the driver to
mistakenly communicate with a detached resetting device?

> +}
> +
>  /**
>   * sdw_slave_wait_for_init - Wait for device initialisation
>   * @slave: Pointer to the SoundWire peripheral.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831140157.1736=
905-1-ckeepax@opensource.cirrus.com?part=3D1
