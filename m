Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792412;
	b=hdUwzWPEcMggAeIeQ09Gd/sVIT+DfNAKKhNCO1QuaVz9TIErtf3n7MYWljxHQzkjiDlR
	 ck7MLlvRQDE8v9IvPr5V23G11JB0gAFpbinrB1wzx9ZAbP2G85qbnhMKsekh0q100GiVO
	 ibnYZ1c7wCYIbJDSqXmpvRSCKQt4vQjbscogxkNUWwO0IastrFWpSBJPsS1sxcf7fMiZq
	 3Zi4GAw8KwkUYMb6q8kEPYybbaRZr8eVnsTy0pghM2BB3XJ75ITD62kkjipeuoOdcQ7xF
	 iwPxKEje2aJNnvS8xft3OkXxIm0Ic4H678X4NuSx6gJ1XsSvf33gSdaJgkpxc53ucZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XGwVE3EdLdMACu1raKJUeuumJNyhfrbw8/XPnWJIIbk=;
	b=kSzsyzGCrRLYGlBFVxezi5+k3md6DVB9VCHbDCjW4UrfPBha59xmaqNHHXuBMk8oc9IL
	 S2L8w98uj1jb/nK5ntw3kVeoTZVwKImUx4K0ES/hOCYqHVvDiwIVD2ks6Y+9yi/pw3RZH
	 /FMz9IhKkEGU6R9IScupabBIyBMGLajahxnMt9FUnVyZoRdMokKHUkcl8CMJQ46SzZgYf
	 BXvu8lvPNgfEGenxTi6SMhxlO1xVaTYlzF6jq+GNXsps3sacU9pTKoYzXdcRqd7pjpSP0
	 yrD7twvVozXLB2XAHdGSNWPLrhjVpGim3w3GNvK0JI+jEqcExzSAH2qyCu+nms/Lbbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fW6RK714;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A2606A335
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fW6RK714
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BDE1F00919;
	Wed,  4 Nov 2026 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792412;
	bh=XGwVE3EdLdMACu1raKJUeuumJNyhfrbw8/XPnWJIIbk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fW6RK71423dNFdYx43II0iJHYVBYG2HbA47s1fqAzojLw7/2hhvjE1m8BVebHOfcw
	 n8ROBlK2payocxfviTqysIia3TmAB2Y0MEv+0qO1lBnp1+4YjWkTkXe9LHyoUADBln
	 lZyBfxnxB7oCtjkupO5NfMOIcOslf28Nj+/JLvqFU7mz+9suW00NkXsW0EtMFqcEzD
	 znV99rPdbUOqmsEcpFu64jSozSSF5Sl75LWj//62qdcUnciigjGgFf0x8e5Sp7Pjym
	 +bNcn/IjnD+lBSqW8n/3MsuSu5Pzb+dg84lH84lz405/cocUmxHjxw3/d/0rHc9OH3
	 TWF9569lzL3vw==
Message-ID: <sashiko-outbox-197195@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: Convert to subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
References: <20261104113330.1634180-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:40:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>=20
> No functional change.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113330.1634=
180-1-peng.fan@oss.nxp.com?part=3D1

