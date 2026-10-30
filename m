Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341638;
	b=wE6rHZ/ifvKmRYWxSEI+J9RuHoLHGGNI3B6Lg35DOon7jK6ryUCdF7itjnbR0Qybt0hw
	 RWNW/EOe8GIfK+Tr8vqQIb6onYt5bIISjbCAWcAN+4MrKNbsg1aeg8OlFJoMlqZrXMFOR
	 aQKWdkWo9jWXFChmty24oZnXNqhW3751OJRcF3dNF/aKJZ9qPpcOsRBSmiCz3flWnL9jd
	 /zB++sg4PZvvvYsL6WhYApsycPUU+q1yjt6RPSNMjXeIlCJFU8Mk4IrgdXZ2PTYworHfk
	 9aP5VXW7BjvbIIl3qCL5ez+uWu4UK4EEAkdK29nTLAPWCW/xLMKW9q323QQg/hPwK4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v1J6VShXJvczPJoc58dhIoPemq962kvSlSnx0u4vAYM=;
	b=YzYvGl0UZyQOQ/nwZpmY+8cIlT5+EzmS1BXoGCjXHz8vhepKmVQbxYB2gLk6d9wobzGL
	 4MuBcHGS1ZqXk4/OBxVhlar2zXm7ZfO+QzgsRq4PwdmkF/H5ChJmL6BTEUYIYveay59+H
	 BPu2m/vQYbs+/xR4AIH8U7ZVjAO4dDH+E56qqxGvtl2YR+3+NGSvNDj87pmocMGOswqXa
	 nrJOMrL45+aS1WpNl8bVK5Ea5sDiFYgKJwruRWivb6ZFR12IruWHrwl39jqran0YjMG7S
	 3MiefwQN4R+ScroacRGlk5OMip1ygXsYhru1gZ9QakqfUhElnjWgoleUQw3NAB/qdEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vd7aviqa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126FF606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vd7aviqa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9A61F00A15;
	Fri, 30 Oct 2026 06:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341637;
	bh=v1J6VShXJvczPJoc58dhIoPemq962kvSlSnx0u4vAYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vd7aviqaNn4Cw29A8YzHULoL+HGGtDheIrvRvPXrbbNu55XU3LxeebR/Adf52Oie/
	 yCdrPKksUJSpzR/Al6g2lcI+PYnEkPQvXX/h83VfyVlm+YeYOACRT12vgQ7ETt6jcd
	 xOeCvHpyQdFRUnRKTYFe/7/NnETdEErA/97Jyrmw6J9/9lY1mI2BwRrgQgSwkoVGBW
	 11IAqFzdaHb2unctf1BZVgxuKAbJfS3oc+ZBG6P+Su0TbHAnodTheQW17p2BwSz9nC
	 bnXQQXRmHIiEqTNYeWk0KFrZAH1AIGded4wTxIV/3zhicjG0b0STeeEGQZ/llRkLvI
	 afW0JDixKJkjg==
Message-ID: <sashiko-outbox-190598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] mfd: qcom-pm8008: Drop GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-4-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-4-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:27:17 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D4

