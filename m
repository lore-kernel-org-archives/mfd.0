Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA584137A2
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974633; cv=none; b=XaancM4lNEKilakib6tiS6aRReiMu3vkeOWezmmfvTqch0tSPnuKLle1FzC8oDec8TCROD/R3EadV51dVSVitlhEEvxPkZhdV2NhfubfS6OMch9h3L/i215gUyO5qpNd8hDkOL4zxgL+MWW6K8iHtDYCEC95bSwB91sT/GhZy5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974633; c=relaxed/simple;
	bh=DONhtG26jbSvGhlzvEFcfkVk+l3wVOhcArc8lIljmC0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WVVeKLOaWfY3OMjXUFM1H4rP598jD01FTZNDWWUjRApOsMtQbmY2yz0Rq4IhE6BtBNCBB60RZux8AEkSGKqvbG5hf6bPFjT9A3iIAaJ15uvsCMZCgWUfWyKfE1edTVNMLoXwaqAaImDof4ZfAmwCezx2jXm5YFKNGzVHu96FO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0ewW17b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0ewW17b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146331F000FF;
	Wed, 14 Oct 2026 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974632;
	bh=DONhtG26jbSvGhlzvEFcfkVk+l3wVOhcArc8lIljmC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q0ewW17bNZQGOA3cRr0VsgQAVswYG1VaQx6i4BuXxJQDdxiCiF0wU/aYAGXiiWUWW
	 xfZ2/Klgc/FpqNe1Yy6AoqW3BwRJKDBQ15ZVBVA2T4wD8TPMClfNfvg7IYy00v6y8f
	 0oE0I6iPkh8KR166eWjgunMQpO/JuCW5LUv83LTnEaXZw9VgipoWfJBpxP6N6vxxfh
	 wSGK9Gr5TD7fuvklPQ7hlMf4uOCQbVGiBMs74vcpZZ/l0fTa7rAro4GPnkrLGXlzg7
	 miI2N8s2Wfv6wFRve20DxYNg6L8sxj6gML9KzNtWuoYl32X7Af98zIA7nx5wmT88Pd
	 0A1aBCLh/ZKYA==
Message-ID: <sashiko-outbox-171152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] regulator: pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-2-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-2-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:43:51 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

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
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D2

