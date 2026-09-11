Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D83630A5
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153122; cv=none; b=aHmSGnPzejx9eHdETQS+lopTHhRE3IwACLWJ0laBz9hSxEAfKA6QrgyTSzQFK7RuuO6tnkWAHlOGWyOtnUcEKaM7GocSHenQNn1BXvVaYWA7wvv63sRekRASilO7Xclr/klVgUlqf8kABLQ/EL5YFG28DhyCdSXT+zRBQ9gxCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153122; c=relaxed/simple;
	bh=Vvon+tB2kHW4CuE1GnpTbhtKCjOX+tKxLfXp+sIVEYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IM2Er5jser2IT18AqYjVx0qoHa60Xf7NG1JBvJbQQKuK12by6/mZwZwcvR4UIH6InZ9NU9yy35FxB7NRQd7NT4gjUfgs32EJPQQ9xkJvGOqd4gRH+iUAf9JkoK4UZdxB7bFYR8oMGUOkHNCLjqa/utvHBQFZsRPR1lfGq6M2XS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uj2mazlt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uj2mazlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579DC1F000FF;
	Fri, 11 Sep 2026 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789153120;
	bh=Vvon+tB2kHW4CuE1GnpTbhtKCjOX+tKxLfXp+sIVEYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uj2mazlt4/00Os7lFyoNpFeXov1NCpVMrIuCLbqf+Kk8w+Pk9l2za7R3ciIiVn8nG
	 H1W99/tuv7xUx/F8pnZqPItJ8oXLPjyhtzQ0u3Fu/5Al9dwN/SiT4K6ITEHVm9tnMk
	 DI4LDsbGmAuN7WUgWM7kG2ASBHWb1Xv7bdw8IMEXCI8V17nI2P9rEfOJdzavLSAcIH
	 JyDrzCQn0wdcELfSnf0YNYraUlkIAqOmDP9+cmc4cEzfBu8nghc6BfgHPnzbZ8vMES
	 qsZnCB+TG7+sHLyEHhe/lCrx5yRexhjK9ukpmipNl4Zy+XIOV1WpaHjf+0HaeEJLMI
	 GTKyQU241yZaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] mfd: cgbc: Add virtual I2C bus support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911-cgbc-i2c-storage-devices-support-v3-7-594b53fbc5ea@bootlin.com>
References: <20260911-cgbc-i2c-storage-devices-support-v3-0-594b53fbc5ea@bootlin.com>
 <20260911-cgbc-i2c-storage-devices-support-v3-7-594b53fbc5ea@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 18:58:39 +0000
Message-Id: <20260911185840.579DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Internally the Board Controller has a virtual I2C bus with some virtual
> storage devices (EEPROM and RAM). So add a new I2C cell for this I2C
> virtual bus.
>=20
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-i2c-s=
torage-devices-support-v3-0-594b53fbc5ea@bootlin.com?part=3D7

