Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935612;
	b=PdeLe+ZXk/BCiIyKSdcA8SpKLglCY2NFAXLqDoK3OkN9zPRGV1rulS5in7v9aeKzKKWs
	 3v7Wydnme8qcD0stBxRDIlZ25P8nCmcjOPxhDlL00KgM9fXh+H5Aioc20Djsw/1Bkou4o
	 vJTisEW38rbDpTlNa6iZemTv+Q22the9FYS5oyFUEUCL7rEANwcSsBrHTXFxUSxJkPDWl
	 7t+x9f8aZBo8tCE9OCSLoxK5ib/Si+3XnGAblFk38X2ouboTx7oAJd14ktjyF7TpJL7h9
	 NzipjrI0pCGoBN0gA0FEnO6DZT0Lia1cc9Ea2TNQtiWNrzfNolBANcSUkv+blOK+p3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VlrI2ald7a+3jyeIqYzlf8CNN6O6a1wrmQvrKFSzEvQ=;
	b=n0KVlhTJEgFaVfVOyz8sLEwJGNG/Q9ZD9a9xHmtLpLewAcfTMCbyJF9z675g6QndyJ7d
	 VEgIqiMr6402ZQ1v+e4xevTOM57mPYNfTXoT+k1+1mVq7rrcxrE7YuJ4Gm8Klv/gUhWgx
	 yGHK/UtAhGxFlZXu+kEAQ9N3np05nGcMFD8ofX2jfRFIlhjYczjATvIQ1Qi1u6i8Vnq3l
	 1GJLf/rHOMx3IFWRxuJHSi1eIpHSG7Zu+3SedVgrFZmveQVFD/3bKsY+cN6wyaIWVlSvI
	 mLq7zS73yqDDBcegLxsz1AHFPBcdqwt5IrfO/qXbAwsnGhWeVtizMzQEh1r28wkttWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KesZJdWf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAFC606A32A
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KesZJdWf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963341F000C4;
	Tue, 17 Nov 2026 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935611;
	bh=VlrI2ald7a+3jyeIqYzlf8CNN6O6a1wrmQvrKFSzEvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KesZJdWfm4+96w8UXtNxpnVUkAJOhPUyPgqq27E/YItXaLVsSDdWi+jKUBbVynm0A
	 7H6qfq5xl38yJ95TQfFxPxiaLIcU/Q+KLtweoMykELhkt8SZ2Ou7AJLT2rN0osW1XP
	 Hc0UXn1vZduPC7JM8cOwQcN/SL3eS1Rn1zo0NFRHzt3MKjca3aFrip7U8FkqzhTIc0
	 tvYjhn4KWdtl5MQh0jHAOm1e+abqicdNTYZACBjH4po62l3JYjpKRC0NXKv2T3fkZJ
	 0TaN+OlzYZJx7TICmHWcwrNQ6GK1CPCK/vRRQ/WOUMwVlTya1F8qCjjV9TbVu8Tg4E
	 7O+sBntvghdMg==
Message-ID: <sashiko-outbox-219215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-dtbs-qcom-v2-1-c0697a0bf016@kernel.org>
References: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
 <20261117-dtbs-qcom-v2-1-c0697a0bf016@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:13:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a compatible for the MSM8996 SAW3 register bank referenced
> through qcom,saw-reg properties. The name is based on the label in .dts
> files.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dtbs-qcom-=
v2-0-c0697a0bf016@kernel.org?part=3D1

