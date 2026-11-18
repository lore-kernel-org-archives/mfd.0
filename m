Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966168;
	b=e/upMI97+/lW+iB7OBNQmOJoAS9AifcN34ciNrJomLWKGF2tgAYoQGbMEh3NT800Bi7Y
	 tM26F4jxjG2wtUdg3QGzxIEfzkot0bWRApCuTSoMtv+OYyd5FeMnQcKfuB7N6yC4zJeZk
	 JupKmo7ERthVMsc/+f4sygqNPvR00alccGwJBYBuocGvsZZAOKCwz0dAn4jIbfBWD3ox9
	 ys/Cq5EmcwEHgVkZ4m/HPr0nJ3foQx9ud3k3bDndW1qWm1HVfwEmnbSWm9nlrUo7m8D3H
	 lufY9vFm6Ph4v7F4S9pD4/RVF0plMK5mxp/BqD0xe3BirCusCxnANXh+sfoVz59u8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966168;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IZS8ojHGH17OmbO3LSNybV1wsqQDGre8u9+3cHtlZ9Q=;
	b=nxwvlM0025p5BEex6h13zlwYIha2cR5hNZco1UXzoSHOeDlNmk27NDfShTXWDqz8v7J7
	 /Oc1EJSz1lErGYE6TWDPzsro/9vFh+zZRlKpp9AJ0OGBHKN8BPzVVOs1d9Gw5W91iuXWx
	 EG4Szwc1fUZakZj7qVw+V5eloB5/FjA+kfJpFE9ezurc86d48rIfbVPMvZO38K2FOIbDc
	 f2YBs/y90AHc/wBbpJ1QvhO0blllpx788FhbggWVy0/r1Fvc/NYD2J0XdyYD9f50TUEgl
	 XnI/rvWyn8TF49LAuO2PbviS/FDAWieiKooJ/zqp8Gt++kyxI86Lc61JLHIJio94h4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4kYTX+V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74566606A32C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4kYTX+V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BD51F000C4;
	Wed, 18 Nov 2026 01:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966168;
	bh=IZS8ojHGH17OmbO3LSNybV1wsqQDGre8u9+3cHtlZ9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N4kYTX+Vx8SJG68mJGQs79imjMPgLx2NJ+kRFhkGKz6Rd012sYJZgnF2VZKZ/Dqm2
	 jFSsieCNV0cNaZImZmCXuhSE2Ha+CG/Cz8hy//s/Ay6jB1n2N3pCQE97c0lbYvrixU
	 UCXNlAP/p4h95Z01gPVL6uRx9AIXdALCxLlmWpTQnjGimyJPWuM4XjfFBCYsNcxs0I
	 97ymxel1VggoS/KgmTc6rGsjh1hZtCoVCwjpyLZT7asyKDtQwxNZGpLhtwhuQBQS58
	 HdpbVbD180xgcKj44vL1X/JFl1jPuvqso+33DSqBFRqoBHy3rGfynfsE8iFHtl2Go3
	 Qm7z67l/kiOZA==
Message-ID: <sashiko-outbox-219906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
References: <20261118013935.1573-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 01:42:45 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Keep the node pointer in a local variable and release the reference
> with of_node_put() right after the lookup.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118013935.1573=
-1-laixiangwu@cmss.chinamobile.com?part=3D1

