Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B593839A9
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625809; cv=none; b=PGZhVnMbUE5tsokMMODc9bApxXmcjp/kf1N34ZOEqT/FRubBhpvGXcM1QH5gKYZHaunXVkoJW7CLVwMvgAuthlcviOyDrRYvIxPc0OIe/NxowhRv+5Ewfe4FayV2EpAm+6Zs0fuLGHdZWLn7lv82NWC1LUbS6oIFqyUEeXfugWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625809; c=relaxed/simple;
	bh=ookfOaZ70oSdQGRKdzSGsop0l7pNJTVEfxzzzrh+cXo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K5EeeCKCKFns32uewYiTl+Qpccn46dyq7oVIbGxyxCZmrNtZQ4pYwIcVg8+l36qPe3n0Jk2T9Qq5l+vd3/3g9diATHlvKURMdNZARIXi/nvyedNdS8u8yL1H8OSYVCpk2oinZejCVtf3Q2e78CnSdlbUux7msOyIUHk94RgbU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsTgjZtx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsTgjZtx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC691F000FF;
	Mon, 28 Sep 2026 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790625808;
	bh=ookfOaZ70oSdQGRKdzSGsop0l7pNJTVEfxzzzrh+cXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsTgjZtx6EnWYOkduq79yG14CFtrMT3n6Z5UqZA3Cven+rp/3BbrTrJHv66fsMkg5
	 cVBfP1rZ1FpsHPLyHq35Rai/6i/vjekOD7aFCLvBcH3ZB2VhserblmJXBgytkCfjkz
	 r7BVwQoviPI4mq03cIubHGAyPfe7j9X8qkMqsD/zAZflB6Zq/sPIv0LItuHC3fPsb9
	 QVZEUW5T2C8HDPEZAjh01gKtl059/twWy29V5LTro+ntzFFNEG8A00gJJA41aH0Vrb
	 CDXH3QQS813h9I2Uzhc0dIdyMNu7o75i3v7jycq0E3E44B/3RT06sAFmOek6AvUCnx
	 beUrptMhqgFjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: max77705: Mark PASS2 revision as supported
Reply-To: sashiko-reviews@lists.linux.dev
To: "Denys Romaniuk" <chiffathefoxx@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260928-max77705-pass2-supported-v2-1-c04f3932c182@gmail.com>
References: <20260928-max77705-pass2-supported-v2-1-c04f3932c182@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 20:03:27 +0000
Message-Id: <20260928200328.4FC691F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The existing driver takes a safe approach and only probes on tested
> MAX77705 revisions. The only tested revision at the time was
> PASS3. PASS2 chips are present in the Samsung Galaxy S10/S10+/S10e
> devices.
>=20
> Testing on the S10 and S10+ shows the driver operates correctly on
> PASS2: interrupts are registered and fire, bind and unbind release the
> I2C device cleanly, and the charger and fuel gauge report plausible
> values, charging the battery to the same voltage as the vendor kernel,
> haptic feedback works.
>=20
> Link: https://lore.kernel.org/all/20251023131732.GN475031@google.com/
> Signed-off-by: Denys Romaniuk <chiffathefoxx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-max77705-p=
ass2-supported-v2-1-c04f3932c182@gmail.com?part=3D1

