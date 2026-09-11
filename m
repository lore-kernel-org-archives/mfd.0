Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEE23F9F47
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152974; cv=none; b=pwPUByc9OqKrrzFtM74xL8TPRYUXMutKVMV4W5zhBPgT3jfp0C9lHA6mRz7Ld6XJoRnmmBs/KvWYEDSalo0PSCogypRDwF1PFSQ93vyEIURMt3ggY2ruG6DaJZav5SBJzVupURCKhr0/ka1SXy5a8ctKXZvhc3QHNXOiaNWya/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152974; c=relaxed/simple;
	bh=TiHhfwoaxPPxNMT57Prk2Tx8XZWeF/fx7y2+veEY+NQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+hs4quoZ8UTztmB7bHo6uVY5DyG8aysGnXH7QCB2Jdk6171zjavb3cqjU2IzdcFxJs/hxSLtQnSaiA9NfGS1bR+q5bXrq+NtyA1qzK2gJB9x3JSwg3kGKEoifVta9HxFpMkgsxMCK7RYZ45wnfYq7kDyMj2Y75N7VMp5hDO0ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5et/OJf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5et/OJf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7455B1F000FF;
	Fri, 11 Sep 2026 18:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152966;
	bh=OIOoP0UXUibKANI21eq5n9xLFCBRiRAqY7YQNJZM0MA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5et/OJfLXd8MDj8gkf2sx8dYG/G60qbmHxThX9JI5qHbDqeLiq4tzwWYhmUqoufg
	 pZfYgVfRHpAWAUmCt4XkwkF4g3EGaXrSj+JLAuUUgfPXE4ztDVhNh39nNtXLH16PoU
	 YPCUl8izBcz7aIdLFemoyHJOfdBifNr6MSmn0cvluGn1nJ/rR4WRSKA2Zyj+MQ3L1r
	 E+7CZ0VbEbkbXSy0k7z2xmPgsaG7WXU2j1nxd0MfswbTHX+0zZcmGKzNPboE9HoxsD
	 aLhiN0bMkrDgb82zXLPTS3cf+OWWhol54XATPtkixxWs3Ou4jCoUnDwc6U5vnKM7DA
	 +W4CVBTbYTKew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] mfd: cgbc: Add virtual storage devices on the
 virtual I2C bus
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-8-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-8-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:56:05 +0000
Message-Id: <20260911185606.7455B1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D8

