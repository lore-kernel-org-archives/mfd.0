Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811847;
	b=g6EvlCGTKmcjPrab7Wsaft86SNw7kuhwZ9qVL3MtolVNftimH07itxbfVMmwo6+OnX3H
	 u7HbPQqIPvrxqVZTtzRiMUAYAU+55B0P73XGhKskTIjzPKRqONeHvF5LZ9XDbR3vK7x/C
	 A52utKUbF4V1ndojzYAlELchOFSBO9skXxvlofsy+WB8OX5DsEZpIz4+BsTHDbWiguJzm
	 0N4OyBRVz8LlLgvEiOFJ5VP4N8G+kU+wJ9MnhR/wLU0tSk4dbsxbJ2R+sHAvm8eb0VMjt
	 gYxQ8nd+l5IxQ8xQnPxOXT7T4T1i1hv0eYnYwpfvTTA6NKLxUZKS8apheMQv3Qnt0OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811847;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pqvfy+na39C19WljcJsK8PSUqi3E4pQD38nw+x0A0i8=;
	b=sw77fwcTH0UX6IJCr5nEaBFs++9QJDrw/fUq+zHMlgmjJsRM8mGPHS8bkPPA8KoQIoTB
	 NeZRncrM4x/Mx7LR0cds9hZRaSxivlPSYgCgzMD0mrRPskL8GvkaC8WlICzbW1eEb/Bdh
	 n5tNjRIFdBuO5HgTNNf9Twbgyf21gd+rue7K6uvXuWu6g6FIUsoAO5ZfYg1TiPWSqsmCy
	 bxYTJsJdZ/pFrpcCdp6VY13RyHE7YrS9BQTOEIdUd0a3eGNGUI2emF3New1p9+NEzDuhq
	 LgBhJePZIt+dz2qQsVNpHWaIixJHytHDP0y8GuGdlatj8LXO7lB586YvHznWvxWSv2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUlQ+sVB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83660606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUlQ+sVB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68AB1F000C4;
	Mon, 16 Nov 2026 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794811847;
	bh=Pqvfy+na39C19WljcJsK8PSUqi3E4pQD38nw+x0A0i8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NUlQ+sVB+4lcLRtrQv9Zv70HwL9+wPUIYOij32fC6dV4VwTNVE9Mc8RZdbphJXubq
	 0q3kp+/XRvrd0kMsmcy2E9b1OBDRgS7mHxi/1p/C8b+w4YZ1PcZqre7RoV/6f0YnSH
	 o+6ndaNwADfqsYZdJMRnnOi1Y21e2QRhb5yBviqY9sVrin53Cg8YkKrYAr5PcbeVlT
	 83UlgwyKtOBYIWDnpZU26Q9T6/FWYhymYi7a74iO5JNGs2v78du9E3cB8Bq30Xvek7
	 adEmvWhhEGdSbYEXr2Bpt7nF7TLM+eoGAAS/SIaB4pr5U4bIqXw6G9CcGflEpKuQ5o
	 K/Hpo+4+n06Lw==
Message-ID: <sashiko-outbox-216331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] mfd: qcom-pm8008: Drop GPIO support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-4-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-4-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:50:46 +0000
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
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D4

