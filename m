Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812202;
	b=bprXz/XOBe1IYrOyNZhBhx31uxiGFvu1j7U3sl2kDlIwNjhKb5BymjKFe1ycXWszM75I
	 I/SbwnE3qaHVqn8POKJc1/cCjz8zOUNymtnVOguBjCQvFhe8aXS8TyyIoETmQhm66ArkP
	 TFGz2Had5VRsQdysXl3OfetevwsoFhz/S3UXKa1VxUjrVnCiGLnBe1aPfFVAvSqvw2WqU
	 BChUs24NPbmHc9ckPkSbTzIfejwANNv/MNcLFfTtcmWYB3GotFTjMZzyvfcpjyEWkcluR
	 S8bddB2NYUh4IjJ43UiyczMt4AV43rvVCQz5Qy5Boduz9uAV7ocDmYyYOhOLWeSCosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812202;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1mI69uRkn8yyTvbGvrfRx7UZO9OFJLdIw+5oHrM6or4=;
	b=AtnWP9vrbCoEf1K/8NYkfTL6LbQPRASV+0itfFlIBhhEc8heN8jc7WZqPA989vXT/J03
	 2EOILKkXJjlucvCIxi6JQETcTEcxckQT0RCcd3JzOXoJ0zRuiJmEeLDjNaSoNw4lP5u0W
	 YUliWKoEKsBr2MFohb1QiPuu9y2npUNi8DO7rdS/tNoi6bH+DARsgkzXRumNc1AAOJGHj
	 Fzq6zvJ6VtT91Pc+SyuHxgoMk+vgqTqve5Y2kUxT/eO4HK3CC04p5NpJA5HEHSxxKULNN
	 nJ5DlBJcBjKJcpqpOZ5hNKdIJMwFAUiVnmK1aG5zJO+VUAHT8FzjuTgiCB4bIpGgkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgUUIiw9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13844606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgUUIiw9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8810F1F000C4;
	Mon, 16 Nov 2026 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794812201;
	bh=1mI69uRkn8yyTvbGvrfRx7UZO9OFJLdIw+5oHrM6or4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DgUUIiw9ys/YdxaIpTWqeb4s1k0oHP6iDWazGAHm7ZlUI2IwZf7sR9lw26qOd6jvI
	 0eVL2Bik+hHz27YNlAyqnIGNjwyhnPWlatfe05aaj6qnLiWaCjcObRiqarxjMeZy9m
	 sKrc2hMtk6Z5VYp5RGlB+pwdL5AHi89Wg51JL+2vveIaGhEYYmE5KGAurMCzM/DXfj
	 VHCm6u7Y06pc4qRtALBbn7ncZSYu4qLtp41kavnOgBlv8YiPY/kFADm9sdn4VSnaN3
	 Fm7KTsS0qp8ERK5UNbIhALGPm+yOO3UYMPfNFvO5FGpuUtxc1Zu2Y+XzPPxTwL3uVB
	 2sz1pRmD1mXjA==
Message-ID: <sashiko-outbox-216346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] mfd: qcom-pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-5-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-5-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:56:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.
>=20
> PM8010 supports both I2C and SPMI communications. The latter case is
> already handled, since it reuses the same peripherals as other PMICs.
> The I2C front-end is more less the same to the one of PM8008.
>=20
> Plumb in the necessary changes to support it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D5

