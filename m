Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812954;
	b=OLXbUcAkcAhRkYMbMmYDaGpWDqlpkHJFy3X6G3HZ1phKmCxJPn64XQvOTB3+uswuPulb
	 Js0gDeIn8cyLwmleC8ICvARKNUxAd3KX8uRSUGEIZo+gqNVXEwd/HvlYjuHLeQpL3wIHx
	 +o5E8NDyVdeHVy476AEMYKHyrhL4+eiVHcBde0C/jCJB20ifsdu5Z2D1nhO1wNVSIh7/N
	 2lo0bMjisiBX1e26GYWMrC0cRvAz1jWg876op7t5NlHK4xcEvTNNekHVJVsUzJF9Zuh6X
	 OUvm05Yt/jpIqrFlvVfOrjTDRMSKoFNEB101I0OkBlP0Fd+ZkoQ7lkwhjEPbqs/lhIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812954;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QXoItdflHsPMpQXm7SzKkOQc5FWJfY41Cs+ZCBsYWE8=;
	b=G/n4qUbWoTFHZlHeRc7p5FCcYue3IqhAH5kdH3agrs+CULu59gTEUtJqselo2BST1UlC
	 6VSBD5si+umJvbp37C3HJsvDKk0KGQlRK4KogeGCM6H26KMgxgax2LHrLt2K+32DLeJ6M
	 xmz4ZU9X5E5NM6t5fZsP0FQoWIxXbt6wpEhn5kI2HZkW/WGzS8Z96IEy2i0c6VjVP3dz7
	 mogA4EzkerjAs1BJ7ZPvUdysilg168p2x/uUYxQk3dT9sngf7WIoVkA66Ywo8fBsk8/w2
	 akVMN+dgw1aKhE/Lrpc3CnLMPXVDtdb9gh4BslTpv6Xw8Y1mewHcbnEyBaT/yjDZg9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e63NL56x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF91606A890
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e63NL56x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE13B1F000C5;
	Mon, 16 Nov 2026 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794812953;
	bh=QXoItdflHsPMpQXm7SzKkOQc5FWJfY41Cs+ZCBsYWE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e63NL56xc6NPg16pzeMWMVQtdvaJKpqRYeT5DU6yC98kKTqX7bayhopen0rtyHsNo
	 e0XpvVVad9xOL2iVXTGNMOoQhdZKkWYezh9aZ7gRqdDoldrUE8fefCx2q+4EKk58Qo
	 dU1bXH1RcyVWHi2Iga0fGdNuEbh2mJ2VEUULOdhyQKkCGAq5Z5kkV67ArHiX4lGovT
	 +m/6pE541llNjllkN2vAm/onUplYZBTsbjBUeXnpc/mcH57qHpGhzMWgyXcYPWlao0
	 4YFyr0UgwYc2OPAytL9wpmjdExbh9h/fnFwudv82arxNouvOKWss+ygW7fOpISRYSq
	 ZXj2isG67hWUA==
Message-ID: <sashiko-outbox-216387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-7-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-7-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:09:13 +0000
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
> PM8010 is often wired up with the interrupt pin tied to ground. Only
> register the IRQ infrastructure if we have a parent irq.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D7

