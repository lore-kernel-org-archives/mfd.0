Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F1743636A;
	Mon, 27 Jul 2026 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177262; cv=none; b=MMdMMW5i5uRTwmYWmg9EyIYP2FZZMUV2VwNSGP5jgxNJBZ+8p5ASXoAacoxxdzr/V9aB48d455yQoUx1KeIyxyAWWET/PVzs19+PKKVmlivqkZmkokcIFrBOKelosyuV+sAlrNU1br5D14WvC12iTUqo+dh6B3jOPtjv+e8ytIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177262; c=relaxed/simple;
	bh=P303M9fopkExUNwoiCPNBpRuNtM2ZkRvRpmWqj+7fXE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P7KkFC6Swr/2DiKb6aA+uLEQpylNDIYb4pG9Pp/DJYHlXoclmWhyYHjnCaRBzJHgeUv2mm/g5dRk42w0H2s/GRt6ydt1c9d2cJ1YW+WB4KJT941V52whJkoCa+6ZdBhghTPvJFiwGFS7bG6hK/1opRB6MtYIsfLARkVOinWlU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBDqq6tQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBDqq6tQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A2D1F000E9;
	Mon, 27 Jul 2026 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785177259;
	bh=P303M9fopkExUNwoiCPNBpRuNtM2ZkRvRpmWqj+7fXE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OBDqq6tQUhIpAO/x8lw+JqDqz6LUXulhDJlcdUhYtu0hXpfR54R3Stq1pOzqr+xNq
	 lO60Jnb0QldGU3VycAp/DLGYHoalFunvsUpohSZiWzw2r63DJ6zW7c9oULnb/6L13U
	 MF13feEWKDq4yaF1Lqi/1q+RJZmdACtl/o5+huralCDt5pmGPROtzyNUeAA8HhwjIX
	 J73HEscR0zpAjR8macUvlGSv9ZHTriFtCBuerpGujca8IwuAtbxJvS49qKNVR79yni
	 D0VVGNlLAxz+a+aUznsbFL3YiOdFOfz4xugC1U8wGOSSV+cCGpOpy5erk/jJWMaU0b
	 /4w4mc5tFKi3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, lee@kernel.org, olteanv@gmail.com
In-Reply-To: <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:34:18 +0000
Message-Id: <20260727183418.E4A2D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> I don't know much about the hwlocks yet other than that they exist, so
> there is no header yet adding meaning to their indices. Presumably that
> meaning doesn't exist in hardware and is de facto defined by ZTE's
> firmware blobs running on the rprocs.
>=20
> The zte-zx297520v3-crm driver will instantiate separate MFD children for
> clocks and resets, which are handled by separate clock and reset
> drivers.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D2

