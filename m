Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4747F2F9
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792385891; cv=none; b=HXQDGxoNXIgUQEZwUgdoIvK8RpPhsgG5f9Mgam3r2BiqXVr8ywBi3IHlpepNwSVozyyvIp8KbdOTfU+TjLq54SfB6wFIza1bQwabfAIb4TSuiviYnsSnbFaOlJl/d2g6lctn1E+JQjqh5QVHQMBwVxg10gAtjrHF+kByvi+gLxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792385891; c=relaxed/simple;
	bh=RFh1vaqiCPDidREbk8BcKqvJbk7vs39pYtz/FIvVjxA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bzkzAkNYI3GQRZaUdarPk1TB8Dmf6nD6+acmjpuNxRgVaRZUnRb8LUIelxOB90+Lur4m7M+8h+miNeKVt9I98gK6fOf9Whv5pzNy6HPkssObtiJnoxz7G2Pngb9+Nq4fLUEKovgNkgwf6qxABk5m/N9yJW3t6E9Ev6O6Kw9Bjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MM0I6acA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MM0I6acA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB3F61F000C4;
	Mon, 19 Oct 2026 04:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792385886;
	bh=RFh1vaqiCPDidREbk8BcKqvJbk7vs39pYtz/FIvVjxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MM0I6acAmJGlo6l77ysdiDqWGPthpFFbV9A+8rI69mtFyah9rFfghS4aXBZE6i5IV
	 K8w8YbwHOQFBHhEZ7RosVZCMku9l11CAM033QKbFB2YDkT0rZSae28TCX6eQ5LXULD
	 yUhXe157zWNgZCf4/Wtrb8GLuN3pLiXf5AHL4GxH8qEPEUOk8iSVkv3yMV2iaAYBgI
	 GxY0pEKCSdUJW98E80JNnS2D805DHTZ1RSwOoQRJkgzdDVBSjx5WYqwW765t357BVA
	 Zq2VJxRwJ7EZg5ig8fBADsaIzoFE6Mi7txM99qLOb4PdnLaFo5Jk6A+jwtj552I0Q1
	 cqYTyDIahHYGQ==
Message-ID: <sashiko-outbox-176654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 1/5] dt-bindings: arm: add Ambarella CV75 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-cv75-soc-v10-1-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
 <20261019-cv75-soc-v10-1-d386065e2dd5@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 04:58:06 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Document the CV75 EVK board compatible for the initial SoC bring-up.
> The ambarella vendor prefix is already applied in the devicetree tree.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-cv75-soc-v=
10-0-d386065e2dd5@ambarella.com?part=3D1

