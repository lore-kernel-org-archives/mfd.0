Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795159773;
	b=aKxUuoXoVlPvYpU19hYX/Jf/HFWDLFrs7F//95L9eAqd2ioDCp7U+C7Xbd5iV/0hYogd
	 +y4OqTZrpaxbbtUIZoVael7BYmd7kaGcz+Z86TMpLQXAc+kuNmB28HwAV7/EKBp2+S5E5
	 LDDk/VCyeCeqK40Ol6OsE8gtCJtopmJ0J9IeZlwzkvpi7a7AXFSChpWTwqySoUxffB4Y+
	 LUXt6+qXEUuOxrd3CQgxRY0WVOAuaxlc0JF7HEqdvMt1GotwAFs8reAaY8HVhn+Qw7JRZ
	 D4YAyJQOUEeSSeBRFkPOjo5AiNj0Zsb7xo3Jtzww0kgwF1NBJz0fgzfrKjxifjcA2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159773;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KzjrT5I5+tb9aPQtEtlAh24J+4wJHcEx5ytdC7tcScs=;
	b=x0mm/pU5nykEcwCJ0lMr51US/gliLs4fhsWGwhCEae+JilhJm8OndldUZboRS+vaXGG/
	 k3ZyFnd/+5TOQI7z1hNVr9bSIUPDkx82itg4AjHS6SAaICL+TeGvGWT8ub1qujs8XItbY
	 60bB38WvTVVT7l4C3EqjfgE7BzjWAwsLt53PU+omgCnvbxno3kNzdC4XmN3rtUSoCIH5p
	 dBS8SMsTvl7/Vcw3I4fbs022tVN1o9+cLbDtFX4orsLci7d2Q/cm/zt9nWbQU3d/UUiIM
	 5wD56EyQD86Zwg6Tkqne6Qpd5Q2vikaipOY8aNdk8tSqq/GqBDrHmzUwRvdsfPa1f2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHbZ4caD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C5606A320
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHbZ4caD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579821F000C6;
	Fri, 20 Nov 2026 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159772;
	bh=KzjrT5I5+tb9aPQtEtlAh24J+4wJHcEx5ytdC7tcScs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XHbZ4caDZ2zpVt0ZqU3oVaA+/iWSVj4wHVTHeT93S2tqI3dDlOspFP41mSHdMW8lp
	 HyEkJhxYFerc7+TwsV+mAqhOflCLiDPnvZFWcCDp43BxlvUmcfON5d9xMEBuIFz6Ug
	 6PlsO/K7QrsUEsk3ZUs84xS8AHucD19N1bGTWfXPMVKjrHUqTrF2M5YxUyYxr/14YC
	 05FdG+5QEZ+IXWN+/rnixbz418p2TSUnFQ9LbDmVFn1Z9UZRza1LMlfPZp3En4hTto
	 5aktiz75dIuo33z/kXgfubzGiTOm60E2xMEldmcbiE6dhy+wDGyqgTGJrTsz4P/4Gn
	 eR8G178xnP8sw==
Message-ID: <sashiko-outbox-224627@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/5] watchdog: aaeon: Add watchdog driver for
 SRG-IMX8P MCU
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFBlcnJvdCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <thomas.perrot@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-dev-b4-aaeon-mcu-driver-v10-5-a756687e7997@bootlin.com>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
 <20261120-dev-b4-aaeon-mcu-driver-v10-5-a756687e7997@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 07:29:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add watchdog driver for the Aaeon SRG-IMX8P embedded controller,
> which exposes the MCU's watchdog timer.
>=20
> The MCU's hardware heartbeat is fixed at 25 seconds, so the watchdog
> core pings the MCU in the background to provide the default timeout
> of 240 seconds. The software timeout can be changed via the
> WDIOC_SETTIMEOUT ioctl, the DT timeout-sec property of the MCU node,
> or the timeout module parameter. As the hardware cannot expire earlier
> than its heartbeat, timeouts below 25 seconds are rejected.
>=20
> CONFIG_WATCHDOG_NOWAYOUT is honoured, so userspace cannot stop the
> watchdog once started when it is enabled. The suspend callback still
> stops it, as the MCU would reset a system suspended for longer than
> its heartbeat.
>=20
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-dev-b4-aae=
on-mcu-driver-v10-0-a756687e7997@bootlin.com?part=3D5

