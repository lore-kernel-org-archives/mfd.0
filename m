Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580333;
	b=B9qqhJ6xf3Q3xPGqe0Y3Fc0Pdu1FAPSWfH4DeVyObLpGgOo6Ka+0pPT8Wbhu8sQnl3pp
	 8cDTeSxHszWKNxFQjlGofgHF9zUSCiSBcdfxK0G3Wr42+k8mJoVgPUeHAEgWBoc7vyL80
	 ymA1+fqnmIGxXtB6VTBJrd1lGhhaxOAoXR9LoX2iC/9aj338oDn0Ij3ynvPT71tH/9Xoa
	 jpe6awTjpnpXJ3jjrWTSOoP1NyTOjHN2AgVeXE5C5vifBStdY3bMDsLZKL6rpYB9yU2aw
	 4B3bvVpqqSW43cDCfogMlebtJ6biasJH4EMc2PSdk3/PDs/D6KLi3I5hYk7f6lgqdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580333;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EGtvQ7/1Vj92AxCsCspZj2EJ261SW1kWsMNpt59Lyrc=;
	b=FNK2sFeTcv9aykGy05sxMGgElXCnQKBSuXUxfPf3LdEctrm2dW0WbrtlsaeNU3tJVwtV
	 d8anSWzkFvFp3Q1UnLKt+iHokCih2BNt6c+y65oZrUBy51xrY5KBb68S6mTddl40swBY5
	 gbRUqOkP0odtVv5NQKc/eUidaFne5wc/0ogRF1QLHEBlWpdgQW0Vhl1rl+KT/+UdYmt3t
	 /dRYfvV7ABWFlc6CIp340gkNVTnfADr43ug09vu0L5mSw0O5ax3R5BT3GCQumMQ5oTbp+
	 YjMotpsf0GR+x60YEr0jDvFhD3ARvOztfhrWL0vaDtFDPjeu+t+ZjTNyuf1ca4fkSQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJXW951y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452F0606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XJXW951y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEF11F000C9;
	Wed, 21 Oct 2026 10:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580332;
	bh=EGtvQ7/1Vj92AxCsCspZj2EJ261SW1kWsMNpt59Lyrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XJXW951yovgRAbYuTVA4x8zecLyNwk59sbU97cfrgeTsXPrF7H6ZvluUrgKyB+KLa
	 eW851VVm4mTMxO0Qb0VqoKcpSjVdXCz5P5MqNBF25TgWWiWfciwJX5iL9U5kYCLjuU
	 as2I218etGl2QAA/fQQYexwm5km20Lv8i5Uhzdv3dssijiydUOg+h7W/RzCTC9BLsq
	 MHMRO7KukruUmV7cQ40M/qc+hjVkGxRBm8edgEKw8WMVRXkhph/0cyzSUByHgRfA/r
	 vi15+64v2/uxMXMUNjxSXK30DnSPMLf3kgnwDCphZH56hK4a4aEKvBPZ3Gsw/I1B3m
	 FBTzVyDwispew==
Message-ID: <sashiko-outbox-180136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 3/9] regulator: dt-bindings: Add MediaTek MT6392
 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-4-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:58:52 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
>=20
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D3

