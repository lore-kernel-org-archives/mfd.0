Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58814AEBC6
	for <mfd@lists.linux.dev>; Tue, 13 Oct 2026 06:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873755; cv=none; b=fVRuI5DHnrWKqM+5isC9KJdbCOEwV2UQ3b/z5JaNnfbV82tfWulDrNUuHjM0L037Ed5FJAGt1GDZ1XABXgF13/+25Nu5Z513fBMII6E/EgpAOuh9rIUOR5kVDRtByw4+ZWALwKFZHCdp3HIVlt0k4lVAAbdNeOia/4E6PL2GNJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873755; c=relaxed/simple;
	bh=c9epgcTL6mtrH1FaJ7UbtdQDEPxAZw7mqj2t5EUSBYg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KPDUofwHlRrt1dJbB5FVwoCZCSl/cVFW+sKp5Kgp47bLlgFitBh0vxDuQ4tO2MelFjg1BeaSg72oewUdz1lMV+mvzaZK35DXBY+BbPzR5BVB6cN4apOtaLgmmDCjSO7T3Va1ji2XuCQDRLCv6np+Ks/pNljez2AW5MWtGu9DaG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkLKiFwx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkLKiFwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421AC1F000FF;
	Tue, 13 Oct 2026 06:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791873754;
	bh=c9epgcTL6mtrH1FaJ7UbtdQDEPxAZw7mqj2t5EUSBYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SkLKiFwxXT2ol+/rfBMoPE3M72JxwCEFU+DqEf5M8NljI3ZEsYSD6IuGt2g1c0Aqv
	 LNJ1dTEcrsnFYEdYHL80TcOEnQZBnBQ5GrH0bJnQrStSuAQZITkp7Peq+VlKlmzG2o
	 98f1FKFv1Yykw3GUDIzokQ109XCusWsjkwsnZFAEnWUFyqAE/gM8SJYOHIlKbDgVyt
	 Tb8p7J1kjZB09MIjk/o1IwjcEj9pujpnRHYjM3/n3fi8O4mVeJOUmP1IXbhdJ38ixv
	 m3f/ZJgF6kx05ZgyY8jYJOck3gJ90tC1PetL3Xzh8g/CVtkPbBccav3ZnBfWsZz6X8
	 3rgbgGi1Vf6rA==
Message-ID: <sashiko-outbox-169122@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/12] mfd: nct6694: Validate the USB endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261013063259.2734757-2-a0282524688@gmail.com>
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 06:42:33 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The probe reads endpoint[0] of the current altsetting without checking
> that the interface describes any endpoint, and the bulk endpoints used
> for the command transfers are never validated. A malformed device can
> make the driver read past the endpoint array or submit URBs to
> endpoints of the wrong type.
>=20
> The interface exposes several interrupt and bulk endpoints, of which
> only EP1 IN, EP2 IN and EP3 OUT carry the command interface, so the
> endpoints cannot be looked up by type. Check that the expected
> endpoints are present with usb_check_{bulk,int}_endpoints(), and take
> the polling interval from the interrupt endpoint actually used.
>=20
> Define the interrupt endpoint by its number, like the bulk endpoints,
> as the pipe macros expect an endpoint number rather than an address.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013063259.2734=
757-1-a0282524688@gmail.com?part=3D1

