Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082523;
	b=yGpl5b6vlT11TCPof6+9Z/tzX3lF4E69AnpsB0Ya65Njvkle7HwmGCBEM4IMfTF+jwEt
	 C9rZZBpAz79nUTu1ybEpE6+qjIJmW7/X6zqBs21DB/RqXqcvRycgw3pXCOT1tj+nUGo29
	 elrXi+VzbgmmEIvhnv+lRfHa6N9tKofRYsaJn1RznN2fXVU+wKlpiuej0GpiGI+R9cWP8
	 O8d/DVzd3/REXHL2kfGDpX4PWDjKHjGuMYg+z4NOOs8EYWtoaa7WAWwj3xrLX13QzyBrr
	 6hM8j3DSiW6dn9qjMg0n84JivozzMUDmtgqLAdxJHRErKWe+ExGJ9kO2h5+e+JN8vTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082523;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hanXrmQPdaF09VVq/22bIyNiMf5jqO9Fhu8YBoofLVw=;
	b=kLhoEOziUY7AHXkTwB1P4ry3fK7cLdMSsLEZsBNJc++5gpRug/dlNw2s2r8TsxZYZi1J
	 0e8hZWDZ412/XnL3AuGrNkAv75UXnhHql5+ZfcTd2LNTvfga3yLuOl/AqhDvWy1IL66K/
	 Oj3XV0d0s1raQ9js88Gbvrhw0NiwIu7ZouaGys0NCiuaaVRtM/QqmAeecfrtOEaHIutIL
	 4JIIpzTzrseBb8gU6gS7J+kV8GA4509vYrLhSQhAtifYIrXn05GLB6f0MAPJLLjeaQjHZ
	 gF0VjhbKTRHfKjN3aSoOkVF5ugxwtBSoAwrVV2oA89Hhvz5JDIbD6xYka5IdTcadmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EPP/k2Ed";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC818606A32F
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EPP/k2Ed
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76051F000C6;
	Thu, 19 Nov 2026 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082523;
	bh=hanXrmQPdaF09VVq/22bIyNiMf5jqO9Fhu8YBoofLVw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EPP/k2EdJdWY+VAc/BhcXLkwPY6TKwez4QudorSlhgZltkGDKCSYrdFPO/RqPGkpc
	 vxi43CqBFF3xx/mnymntWlsaEHGSToFIbfL6I2hB+5gsT6Ob5LZ2XrCi5SMdRntoFt
	 oyUIF0h1+e44N1xugpgB4pfaKtriaQljm7pOsr5Y8ITsOvMHGQs2hoFRWjMW3eNNNB
	 Z7PsW6o5b3bM8vbnd0aelb05M9Ee3QwD58Qh8fYPs4Vnn2MRSkOjBZ5WqSTu0eu7c0
	 MNBbAUgQUCLkurB/ogmc1Cl6xsijPDOb1vaCZUD1hv3aH4etrad2lZI2zvIJuPBbBF
	 WuO6xsPqgUhjQ==
Message-ID: <sashiko-outbox-222900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 2/5] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c
 hub and on-die regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261119095449.555593-3-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:02:02 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>=20
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
>=20
> All variants share the same register interface. Read the implemented
> target-port count from DEV_CAPAB, so no per-compatible driver data is
> required.
>=20
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095449.5555=
93-1-lakshay.piplani@nxp.com?part=3D2

