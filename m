Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974654;
	b=O9XhkdEUku8A5IzcrOKhTFJy4wre3AUmoDw/UBHelWC+D6GiWbTgmPmeWAGW5qljACQR
	 xTseRbsb57qDldIc1kMO5Oa4X64GsYVm8gOxpZQarjMfiva0FrtCJjS9qR7DZ7+JDn5jR
	 K2aPt5RwVq22KxKPsvOD2vwFF1X0+OGLYGMU6pTnMn6nUwUkRlKfmBQoJGufb87m2EH5L
	 tR6OHpwafvMAO2CMt5W3xDispH6C3RxNM1JpE0zz3dkODymnO4SkPhrEwFnwM/DhRayxK
	 Hq1fJdKztOObwkf765fBs5LZ+hNKRLCyHbaEbOF6d1rp6wji4hscfGdubNtkVauQKiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974654;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HGjPwxzNurTPCD4hnd2zgJVk/XfH7bHG4y7EDbNb4LE=;
	b=SBEqbVokPj5Lhjj5fmDvQJcaNTEAMCFnZRkcI4kX79BeQBimnKYrVmOu+jt4vhrWhq5e
	 R9z86zL0cv0Si0brYZJPZy4WMsNgAE2p4widC15JC1DdOkGdxyv1l0WfeGJ6zZiDMQmIZ
	 QpBXNAZwoAye3pX3wFDedmK5y4O5OxJhsV2GacOB1Kc4tEP3m2OcCv0iDvcKS6Oxyb9Wv
	 qoJgmLv6Pm/PaRIs9ymL9BWkmUxioyh+V8FfEJ4AGWE2JihBgqHbq4zFLXDOl++73kvun
	 IvUaPPMcJ/kPtoyUW4gbJmK9xxHkFg5PUVvGcJN7dpAGoMxwquPayx6tFdq5eEktiug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMMWXeM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11440606D806
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nMMWXeM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE1C71F0089F;
	Fri,  6 Nov 2026 14:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974653;
	bh=HGjPwxzNurTPCD4hnd2zgJVk/XfH7bHG4y7EDbNb4LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMMWXeM2JirC/hh+RfLRlPpRvFdismlI5eivcenFFRtfob8cOwXc06WknXlJ9vroI
	 zk72rsypKXo0HKSW+rk+aBrjxUZPc6G5PJakpp8sWYgcBEuEoRFP+qy4SebS+7Z0Ov
	 EZ7bhLb/Dmjvpev18QauqvGtue/sKhXxFCLKkue68AsO3wSigZc356yJP1xU/1dgiL
	 Ttoa8DM1lBURPaRbhdUcrNXgoRjgwBEFMh0lsxF88CdlF5pqO17pBCTzVZ+7eGEfUb
	 StU7mzMy7vy5g6FDeTtRMCCPaOsKwnYzguUZ/lxtTZuTdjnbLzv5Z+xYINUM0eQ/YO
	 1NBbtE3JZS/gQ==
Message-ID: <sashiko-outbox-201557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 1/8] dt-bindings: vendor-prefixes: Add soce
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-1-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-1-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:33 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Document binding for System-On-Chip Engineering, S.L.
>=20
> Link: https://soc-e.com/
> Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D1

