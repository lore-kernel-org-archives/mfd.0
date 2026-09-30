Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2C533F8B4;
	Wed, 30 Sep 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772559; cv=none; b=VK6MQA3ejpKezUeni7q0FpDBIgZvvGC2JnpVTc5XO1hh64lqIoiCgBLS3chr7vYRP8wvHBlYkmyatxEhNk1m7QPOXBcPeYGZ3JUKGGK0XEriVz0veqmSIAw+AXVBJVE5YlBN2/YA+pAhNDTShRgdQ7zSUI7nBhD0ocrhnW2Vhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772559; c=relaxed/simple;
	bh=Z+C27N9jeqRzgiUCQzHsEwUGjbPJjMl7/erty51YiDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GT6RwhoXCZ85JX6ZX6ml5+dioYZYlyqahxsHgf2+4rqyqRyx2QY9XEVqytONNETg80Ek4yiJtUamQXx6RvDk5l3lNOEnqJhp0Q6uA8TCBI19l0wqIIcWknvl+RAnXwKFrx0Yfh08MW//PUiCVIHiPpUOqr8u15Y19i7ihxSMV7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYk98AoZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYk98AoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887DC1F00898;
	Wed, 30 Sep 2026 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772545;
	bh=Z+C27N9jeqRzgiUCQzHsEwUGjbPJjMl7/erty51YiDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYk98AoZfrAA9uxKMilW4vDSEZQ4rLSIuW1aIHDQlF+qEmM5IvanfWzeehNoIwofs
	 Be7dYD0V1iYX0cFlz0G8BJ/KDMa8pigBHQoMpKhu7aG48AswoSTdtOcM5suwxvtkMj
	 55Xb1uXMABj454hFFoQ52KCZ3vVtLZO52M87Islb/qBT3d7GyyVPfqRSiz6pM7PK23
	 w+rdulnGN1K1Yv1y95iNpRF2Xfdz5fjTTrHY2856VcEo13vMmrObhCqIeKIdNAaZab
	 6ZlFhR996fyD0yg4x2mCwicYUlUn2ZItPvMealaCYYwMJ05IxCfiWSfG0vyN23k7Iv
	 HfE9/pxieYpSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] arm64: defconfig: Enable pm4125 audio codec
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:49:05 +0000
Message-Id: <20260930124905.887DC1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Enable pm4125 audio codec driver that is required to enable audio
> support on Arduino UnoQ board.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930124607.1109=
167-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4

