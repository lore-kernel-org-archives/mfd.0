Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417175;
	b=R1RT3hHJogNLCPhK1t/yIhDYK3tCsSDJGTHIM6fw6M32gpWegHHSkkDIFfaE3NrqJssA
	 h6AflRDaK7nQLZMwkMNPKR3Qk4a2zR8JT5q7je1a5JJQ/hw2UmKL7vvjXshUfm1KO1Pjs
	 TMmsdtR15l6holRWvH8vsVxy9//uKkFlfl2zCg4MNJNxe/bznCWE6sKrAp7vbh8OttMqF
	 1AaN5vYg3dGznZQL+kSTDCCMmftABJuoMSWEy41mFON3Hn6sGyjExeMvJfQV+f6SmpcjH
	 SXrvscNmnm+e7+O4VpkBOmRz8sqOzrhjVJnJhKigN7iGnF47FvJQaPbAVTksYKXaKZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417175;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A1Zk9BU1bsOC8VQGOvnq13By8GIxwyKRU5SaT/k79w8=;
	b=gB2fvx8dLtQvHuf/VI1g69EDMWPubWpOXZgtHAdkDqgsESP+kb4p+f5SkYHkbP78Brig
	 xX3RZvIA4++E/PO9bCbLPskRlSWh3klBpc/LeEIarWe4NDDzVK1V3pEF82CZkXqSdVHQk
	 4Cff1TwxqQ4cMFlm2klm03ItHs9rgZCmTPCFbLqHNznnZhwuMgfDv1+DkGy+crHIMApGw
	 NjTsLfUPTvEcNcsCCqA+L3+PNkzGeeGzNytolZCVGnm12M59xRXqw9F+AXr6BBysHPh2L
	 B5adfCiewJZYSYph91shYiaSC2OEEeWuPNk21mIXUCYk79qI6reE30vg/CricyhUByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBa6zYRg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C2606A336
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBa6zYRg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB521F00A05;
	Wed, 11 Nov 2026 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417174;
	bh=A1Zk9BU1bsOC8VQGOvnq13By8GIxwyKRU5SaT/k79w8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBa6zYRgvkdn+gmPdYF/J6Gawuk0o57dCV4xAzgNqkHtee4U+qAKr8Yd4JmQCxcFq
	 gt+S8np44QV4GC39wjETCfwO0WqYbfGfOIWg7x/7paa9/BtgGsNKgP/yxfQEjKWLq7
	 9W1jYDQ/1+S0I+8t5nkWVJY+UwTEqJDtzrbui4P83aY2OcLBZBiqzxseDL5Nm/TGqH
	 WT+5jGY1A/EDPh5xm/cSHpwSRj/h5GwO4UzQfCZIy9NYlNoJAPnnTwedyPKmQUkkYi
	 /ifooUXcqtaPjm6lxBfAwUoBKx03cEpAKjtBSr6swR9bX0EMW5WqgyAQx3aQMvw2rJ
	 IJw/tUZQJfN7w==
Message-ID: <sashiko-outbox-209386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-7-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-7-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:12:54 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D7

