Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095801;
	b=Q/qKl5EVe8WFwmZNI7xkJFpW60ulqDy9O5GCmlzxKyZcc8LR1XBlZHTIaMJvwdYow3fA
	 7S1J8/LnvNuTEsDk06wuH8J7k9030QR34tmSjuKFIGvmzd/4FnsnOP2zqrKw1gMP1qjxl
	 V1Wy8v2RxQLlfFP7Nyl6JxdaIb38p+fGsQ5kGz813DpD5EXJJMmD0zOSxZ7MiCRDg4JT2
	 ey4nI2B7JczGraJPk3TtDzForN1kMpxg7rgm6tWQCjgNq+gFqnknKmshwf7KduQGR5zHW
	 KVj4pIHCgN9eCqlzcAocVPgAKiI29pFI57ynH3s5n/2yVicIcoQPvwuyuuMg7CIqUDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095801;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GZve1IHCjCqA2Y9HP1EO+aTt1VGC2zWXqNE/y/wMf+I=;
	b=FZqAJEs2sikHO6EFD0ugmL7qmoD+n0yaj0zNd04J8ADGSYpXnscqUimjtH1UPBg0uiN+
	 zpgR9mXfGh3tIaW6rAhpJdpyKVIOnHW+Tx7mJ5DkNeF3TBGX0Ya310vCcEiFua+2Xx93f
	 pGMJ9Wj1p4pMnhY2z0TVmX2LBTvHhM5wH6oG2QBC48Ji762104z+KLBAOaOjHxh57/Hix
	 TLqORXzosVKRlIw8Uioh3AW/5FjuRG+j/0QY8HNjwQCJB16yJb5ZC3b9ViI2AKRt+BgL9
	 AAQcWPnxmNdw+/WYXnSL+z0j0aVFq8XcxKJOLAGXW9zQXPL5NACvZWx1mARKEs32MYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWxBpSzy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB26606A320
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FWxBpSzy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA67E1F000C5;
	Thu, 19 Nov 2026 13:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095801;
	bh=GZve1IHCjCqA2Y9HP1EO+aTt1VGC2zWXqNE/y/wMf+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FWxBpSzyKVw2d03SN48zT88aIe+sHsUCER5Vu74rnWLaK19m0RxpEvxgXINZi1GGd
	 6hHVJ0M4OWAyqTvOvy5ruZdeLKb/ge3fWA5zXZdGKMJvMw+duNRzNCt7VIeEvTTvj1
	 aANUTNJt2IvIIx4wkgA9gO4NbryljAzSkoGYlzaLXqHWqkfbO9KwpCLvTPGPgGnG+P
	 jYKIJkddFHIleJJM9TkwNasco05s8KoBa7YT82R9RGUpbHXueLB29yYZEnB9TYpKAp
	 dNNzrG/RjjKsaXEmVoPwxFFYhiez3LLRDihlLjS45RGKENJlbw3OYqozboVGuYM6Rw
	 1pn17BI/LhfXg==
Message-ID: <sashiko-outbox-223194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:43:20 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The interrupt descriptions added during the conversion to YAML do not
> match the ICOLL source numbers used by the existing DTS files.
>=20
> For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
> detection and sources 37 through 44 to channels 0 through 7. The DTS
> lists these sources in that order.
>=20
> For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
> 15 to the threshold interrupts, sources 16 through 23 to channels 0
> through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
> these sources in that order.
>=20
> Reorder the schema descriptions to match the hardware documentation and
> the existing DT ABI.
>=20
> This change was prepared with assistance from OpenAI Codex, which was
> used to compare the binding with the reference manuals, existing DTS,
> and driver ordering.
>=20
> Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to jso=
n-schema")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119134041.1661=
1-1-festevam@gmail.com?part=3D1

