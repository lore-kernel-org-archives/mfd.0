Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9853F384242
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873842; cv=none; b=cjisgdP5qdaLp84Ds7u1HxIEK+DaBXBiN/pGk8rgwAtvXA0tnvk9+4P+emHM3LMfGUOXUtgvbHOogmMcPDGWCIPs97xAEvSkI7GyxHldXaYUBjv4X6Soh8uUPwXrZqBgPy9FmQXfyLocrevrB4VawVKMp2byuxrZ4j6i96Pr5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873842; c=relaxed/simple;
	bh=n+GKfVc8c3fIf7/fponvpxyccCXgblnIFNshzaEaL2I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NhUvlmBDhGHXWXGyGN19MVkPZpFVKpmiIIRFoRpWGw6Xqu4MfHvPYZ1ItdH69FuZLg4UgQWce94wLxSA1wSGRTYDUdz2kyKdf8YfLTGe2BJwLmlIKZjsoaio5u/RKAU1MRak9TZTCcTDo+vstRLkIlSC9P01xoHROBkEwtdbN9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e86fZn38; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e86fZn38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FAD1F000FF;
	Tue, 13 Oct 2026 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791873841;
	bh=n+GKfVc8c3fIf7/fponvpxyccCXgblnIFNshzaEaL2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e86fZn38edemEh4daYH4inlUHoXmw/40x8QfR/tp8kV5U5lQLdVqBXqM9sM3KDfwY
	 7LFDG/AMlpf9i46pjICKKOWgRwD/7vAfULVgslqu5W5jVL8iOoSVeyTXCqAtANG/Ve
	 9+B4U+6mP4+smF1P4McHo62fWS4o6m2GwR7qdM40+Y47+SL/A4VS8cDBRbew0+wcaU
	 qetKYxKR+6KNk43fAoc/k6mFGHDdMSTeIEQ1M66fHOg635kLv5flMqVffsYEz/JKUH
	 AFctBwZM7+l84Ags7es0AuNPafXJjU+m3+f4xF9jWDDF1jes4K+Bsa0Qa+IaEE8/xn
	 /SWBq9yt2qgMg==
Message-ID: <sashiko-outbox-169126@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 04/12] mfd: nct6694: Transfer data packets via a
 dedicated buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-5-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-5-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:44:00 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
> drivers embed those buffers in their private data, so they are neither
> cacheline aligned nor exclusively owned by the transfer, and mapping
> them for DMA can corrupt adjacent fields on non-coherent architectures.
>=20
> Transfer the data packets through a buffer owned by the transport, and
> reject commands exceeding the maximum data length.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D4

