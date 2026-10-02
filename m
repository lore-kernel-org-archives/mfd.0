Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB380310651
	for <mfd@lists.linux.dev>; Fri,  2 Oct 2026 11:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940078; cv=none; b=N8+q5zD1TatSM51Ab/pfI7ZiO87ZZIKr9vIMXpUwcbR6D9wpJkPCDEe+ueUZGK+vMPez9BoMuHZKJwJh7y7+L/Pwu9F4eZMl3yDaFIIQekhVHRBce31pP3RlvTT86hhXHOSeTxAKBm+LnEql40qRfyGAJewl1gFnI3WzUv8DRU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940078; c=relaxed/simple;
	bh=hDLXfvXCpwtF/80oROjkMVbBzEHsb01q+aKHFbjLibM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X1IbAz2gjLaVgKR41p6vles5YcczqK5VOiGCmOOOc75cYf8hNWKyyeTrKK/OV5AtzZJcQoGj+mqc8iteOhL6XBFHK0Xr7HOvXvf97U8eVeyqxKybW0MADisbUJQxPpjeODTIM17JyUhfwHJOmLv02JU6nW0q7BIi+iTeq6N5a0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHVNco/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHVNco/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2887A1F00899;
	Fri,  2 Oct 2026 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940077;
	bh=kNwDFJWHCr/JE3tHBf1Km3DZ2H7m2oGOBBM7i9ZrIR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FHVNco/eUtTj9RkmGLrilYMATUepwAQJf9kUbIL6h99UJgwLvir7dltmWkDuB4hXv
	 FDn3WhISpA9UhqrhtYGsOm7TnOq5g6/IxrKDsAW6v0ZNEc+r1qTYH5DyzSj9IOmcWJ
	 gcVG962B1rUB3zylrhoQZny5olPffBrxY4ZpczbSdJhrYapqcCVvoJIBeiCMKAgmen
	 sFpF8xqwVAgtX8p0WJW164DVpamZv4SUpyG8qdtf6F0gB/8g4pQMZJQhGS23gGMxyK
	 j8yIcp5TT3kCKHxlZUMNwreKXYXE6/gSEcb8+3K9x8Zj7vbXcW06UuElIHw2wa8x5P
	 rN1MWQnf8zy5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] mfd: cgbc: Add virtual storage devices on the
 virtual I2C bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261002-cgbc-i2c-storage-devices-support-v4-8-eb42e0f1df59@bootlin.com>
References: <20261002-cgbc-i2c-storage-devices-support-v4-0-eb42e0f1df59@bootlin.com>
 <20261002-cgbc-i2c-storage-devices-support-v4-8-eb42e0f1df59@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 11:21:16 +0000
Message-Id: <20261002112117.2887A1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add support for virtual storage devices exposed by the Board Controller
> on its virtual I2C bus. There are two device types: EEPROM for persistent
> storage and RAM for non-persistent storage:
> - Secure Data EEPROM  (64 bytes, RO): static and dynamic board info
> - BIOS EEPROM         (32 bytes, RW): reserved for BIOS applications
> - BC EEPROM           (32 bytes, RO): Board Controller operational params
> - User EEPROM         (32 bytes, RW): user applications
> - BIOS RAM            (32 bytes, RW): reserved for BIOS applications
> - BC RAM               (8 bytes, RO): Board Controller operational params
> - User RAM            (16 bytes, RW): user applications
>=20
> Use the at24 driver with the 24c01 entry (the most generic one) for all
> virtual storage devices, customizing parameters via software_node
> properties (size, pagesize, read-only flag, label).
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-cgbc-i2c-s=
torage-devices-support-v4-0-eb42e0f1df59@bootlin.com?part=3D8

