Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341729;
	b=zYDxTXUFW6DeIm+sXp+Dbzi5GYBF2x1Eb75xxEaz1PdfIk6jnsPIyrxZbUj1M3FiZBcE
	 UeIOBYJQh9lwXNnQ/9sxY+4G74fCQwvCW+WUYxqIBXLJUvx7OWEOmLPfbAfQgOfn6bMMs
	 MvugNKP9ArdIiGloG0HY2mrLm7sBo3gd2xYovAPxxOUQ1ue9BOBOoN7yA2OKGWepkYZJK
	 M+dWadfdsfUXIVlJO29hN+FJVJYKdqofTyAu1RUJJXxo3//dRrlgZH7Whwp3NDxZGY6GU
	 VXaXYvPs4dJlUIJwEuM91IDG9YQ5zBK7RHsKKhuEQ2+4JUIuuJFeClPcIYnYTGMTNJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341729;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=r2uuxG25eP0tCBdnldrOb4O19dIMMHHioM/9YQ82bbM=;
	b=Gq7+i1BsMG63TXlLMvWyWUJZd+BC0I3xUz49jITO99YVGJB2kEhjKFXJtQTgB2jh0lbn
	 7wgJcRWVzNOb9e4ZCUty8aCUKVH5jiKW/KuWvqRjCyDRUpgTL5a/IMACpJwdBvXJjRKAw
	 EuM/ym6NUVNUhsnxgQ/ry9EEwVGKY3+P12y0JeTPbMTDFiaUavSm9cxmqwiTygMFzcx/1
	 JhYCyrrsdW/OS9SXSi+ChTnbZMDb9qVRu/edIC3irbB0xwmJVHgfHPYGaYP2MvgXMxMwt
	 4mgb7YA5pRyXWNk5AsySpNIaM8ZRamD8+KCj6BL6Dg/wbo5p2OJT7zlRm1sga0rpp9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kg9pVquJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502F606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kg9pVquJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04391F000C1;
	Fri, 30 Oct 2026 06:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341729;
	bh=r2uuxG25eP0tCBdnldrOb4O19dIMMHHioM/9YQ82bbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kg9pVquJ0RtdOFu6xOyktowUIGC7v9yodwMRLjd0TOOs++kNC2yvqjXHzF89QYZeS
	 8lE99BZFju8r19m1Mpv+2uUjXC35xSUJA7iFB1o9TXt1kJ6Ch9Y8UybV2Yte2RPMO9
	 JP5y9A8eGqxnR6s/f/qPoDC6tB9VqgmP8xSjjeiWH0sfybhOWViE2MZAzvSmkwbAmr
	 Pzx7ZmSHHIKPqpV5lougmlopvlDzo8wIT4Yr5hIzjf1lf4OOPcsC5nZtDB9thO2mj0
	 8bem5aRzD1CDY0VVFu0TslsoCV9HzRrjVLttGsz+cXHIwQwSDxMl4GKyp4MDCRmDlp
	 h0r88rpFRGZmQ==
Message-ID: <sashiko-outbox-190599@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:28:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>=20
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
>=20
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D3

