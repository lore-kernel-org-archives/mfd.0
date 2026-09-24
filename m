Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCF954788
	for <mfd@lists.linux.dev>; Thu, 24 Sep 2026 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252228; cv=none; b=U3Tly4fHy559DF1OhtkudvIggoSwFjJhGfbzN0E6NTKHzrVrQBqga9iAM7qUE6IPtuqB1xvermlXPumGjNTgOAr1spQ5C9hly8mqdSe5Uub/NORPwV5vIpmpZZcCmLvrF8L40Xi1nD4k+P6AFb62C8qAs68TRPXeTtsrKgCaEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252228; c=relaxed/simple;
	bh=ifUOohIUcG2JussOaV/HQZb4e7ScSpeQLqYlPwN+Ozw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O3R06OQpoW3bcJO2QwLTOIxmnwe0cd45nQBmY+GH7ShWTtoTO28H5wUQT0/l+bOJ0tNLkx9LuY3gjszwAxrGUq8urG8gtVWVHRJeC8lcybTILLaEnyZkPVH4UcLPVr1bjyOgzE5pZJ4EO0djQBoXd1i7jWZeIDPO5TcJb2fS+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wf0LYaOK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wf0LYaOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432811F000FF;
	Thu, 24 Sep 2026 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252226;
	bh=CwmIZSxE5ptbt4ABrPEfUHZrA5TS+NGx7T8Hce98B/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wf0LYaOKkGoR+UAjd6PA6NpOjqgem2G7DfVke6QXYYZ4D8p51N+tkeae97/0pS3gi
	 5ifMqC17t+dSrdKbbr+V76krzmgKBM+LxdNoIo+vGROLSakFNk6qrVUp6ZGpvnoEK/
	 XVm34RpGYGhw5doB3lVSpvcxR9OaQEsfFNhvpV8Ehdrnofd7T1EYk4wRGNHfUfN7t0
	 47fAHFK1oG57WrAsadWvVZqqpEXlS86C+NpKtNCnX2G9ahQrLVRX2xOjULwCRlfSaM
	 qPMvhqPHYfFk0KsAAkFDQXu1SXG3uaX3XNAF4O9lXrEGQsjua6qkKxheinxvVTJaSo
	 jBg173ESfKbaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to
 indicate a device will detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
 <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 12:17:05 +0000
Message-Id: <20260924121706.432811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soundwire: data race in sdw_slave_signal_unattach() with complete_=
all()
--

commit 0022c8987af32edaf369ec5a75ade11e2d3a1ba3
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

soundwire: Add a helper function to indicate a device will detach

Add a helper function that a driver can call to indicate it is about to
initiate an action that will cause the device to detach from the bus.

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

[Severity: High]
Is there a risk of a data race here in sdw_slave_signal_unattach() with
complete_all()?

Since reinit_completion() is non-atomic and executes locklessly here, a race
can occur if the bus ping thread concurrently processes a previous or bounc=
ing
ATTACHED event in sdw_handle_slave_status(), which calls complete_all().

If complete_all() finishes after the zeroing, the completion remains marked
as done.

Would this cause subsequent calls to sdw_slave_wait_for_init() to return
immediately, and potentially lead the driver to perform I/O against a
detached device?

> +}
> +
>  /**
>   * sdw_slave_wait_for_init - Wait for device initialisation

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924120520.2511=
081-1-ckeepax@opensource.cirrus.com?part=3D1
