Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810161;
	b=OS2ltVx90eJkTz/kNCbl8Mk416MJx1huY3DPNkBbPjCgSTvLRyzpt2ZUQlYfa00cACfd
	 Rcyh5Saq13jy3gtQmOavPB6BwgubVClBQPo8oLc6vnLiNnFevsQ2A2xh7vjFeaMgzyu0w
	 YlKj8yHf7t9Zk4iQ54NJForhWYz9JZ1LQEDHJ5PPiYnYu9MLlMYQngIufIDXPhIGfZWfI
	 vw9XUZjN6J594BGqO394jYA7i10HFlP/HZa134O5zHMmlfwT3WwPshht1wIaxrJn40d+2
	 2haaSWsqApdI9fke3J3/j0kfBHHH/zRRrpKmSvsPGxN86HxUCHhV+63TUXzdajFqZUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810161;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ye+MPSQsbhJRdRpF2wpxNx0PEYLlChUYS3uTL0PMcJs=;
	b=r4O1Wbp51PeRAGHrMMiMAyfknxwQcXCD0Vnr5DKq62JUCRNhyMN8OoEFvP+/L3vE383o
	 BRhr3J8URny7AtIVw5liaslDQFBpmvWT9n7pMfFkHsPwRpU40VOrgKJf3H+YhXHgcAQVq
	 uy4Ffo0rNIVAlUz5v5NH0jW1Pgnajm2pFyUdQkQBe7WCtg+BgG1IBaR5qgpQGHfOkTk25
	 K0ugW5sQkK4HuJ80YT9Q2jmBw/X2fKXcCrOXkpFWzqMYe4xR3dY3gerrEsmRacNLEt7qU
	 NH0sGmYmTYTsFdwQ2JQ0V+G24f5rTEWnDGwWwnsd4P3M01vrKTujMqambdtG8uJv7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNJiy7pC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E89606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LNJiy7pC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E3D1F000C4;
	Mon, 16 Nov 2026 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794810161;
	bh=ye+MPSQsbhJRdRpF2wpxNx0PEYLlChUYS3uTL0PMcJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LNJiy7pCNMa3gkh5H2t9+D1MS6izLoJZ7B2apIn20HNGjFoHg2vFNWNV+z9BPUv00
	 ZgEethZmZZhBnhcnUjhfga+0f5NeTYguF8YNDD9Isw6klBKkjdKQQ6OfBrQji3ttrD
	 l8FkBg9ISRtaP5gRABS4RppgWk7zcykgZPXJ6KzHKyIfanjoJNb1QsrimdkQIHqr9+
	 KhT3sZLG1C4avnWdg8w2Z2J2CQjxRfb1r5MgBPXQ11Yib8Buwy8oGJran/SiFDeNOW
	 ClECOH9OFiuPX9FpJXHQcdF1ZCCmhGLUPwVwntibidwsGDMZJcyiOdbs62wFxhQvx4
	 Xn1jQST71cuxw==
Message-ID: <sashiko-outbox-216268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] regulator: pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-2-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-2-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:22:40 +0000
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
> PM8010 is effectively the next generation of PM8008.
>=20
> Like PM8008, PM8010 also has 7 LDOs under it which are used to power
> camera sensors. The PM8010 LDO are of different types from the PM8008
> ones and have different voltage dropout values. PM8010 LDOs do not have
> a voltage step rate configuration register.
>=20
> Add the necessary changes to support PM8010 LDOs.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Gl=
ymur)
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D2

