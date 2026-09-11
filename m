Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325A40927D
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152980; cv=none; b=TVs0IULtssX30i64x0UGoqdkDedY2ZIuxPvpByEsJSid+NgztSoBJlpqoJwIO0ho7mf5J9pzl7pfPfY9qUW5MxqygmNQBa1btTgIpE6WiEnE7/L2w77oXe6faMLhbnIIj5OvmK1eskOru3PpXg3pEkVu+X4/DkBilbVawgaWajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152980; c=relaxed/simple;
	bh=Ea9DBDjOSULmyz8Uags2lWCezxKXBJvUDpqR3EiyX8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F03/p7E+sKksO26+YeLlDNA79eK8ebcvuQ4SmnTfWg7D85OtOppKXHVKKvkvChEOyRi6dqi3nK95mQ6tvy99798QZD82MXSFJyD5Kdb+rj5dHJcKbBgstJ6chsy2deLAOhjtTxU7q8/BoREepBRKVZSaraKyZQ8ng4njIMjhEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do3yMvw8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do3yMvw8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD801F00893;
	Fri, 11 Sep 2026 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152972;
	bh=Ea9DBDjOSULmyz8Uags2lWCezxKXBJvUDpqR3EiyX8g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Do3yMvw8ZDsREb5p14jTDvfoD5U9g96b7l1Q7D1K/IqKPQwixSp26lFbd7/gxdJDg
	 pWDFU8XBf9BMS2IUvCBFOt+9T5zckFOZfruQ/FeJcf7Axtb8LE5fHqgfgpg+84A7nM
	 jV8kxcBPAw0tAoNbKRgr2YQEEMNgCK9CxAuTPz2YBriQ/lQa6y9mcXzGJm46DN48V0
	 VWno8Y/9edxhtPhVqRpa6ACRn2xVk3PmK6KnlkbCPkaVWYgKiI8mWtB2Prr/tUrG1L
	 WUebHDlFlYWI2ibVgEIJTsCtaFAp8vbr91+WsTZsnxuEcEwUuE5loFRzG1QBrvskNt
	 stkv41P3WFTHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/9] mfd: cgbc: Use real I2C bus names
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-5-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-5-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:56:11 +0000
Message-Id: <20260911185612.2DD801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The adapter names described the expected purpose of the buses ("General
> Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
> rather than their actual names on the Board Controller.
>=20
> Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
> the naming used by Congatec, and update the variable names accordingly.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D5

