Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA9033F5B4;
	Sun,  2 Aug 2026 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704619; cv=none; b=O0l1Us+KFVGs6qhVsd3+v7Zt68iNuUXY1mjSsR/1aLDg+WgcXkIVy4DhNEtOjiMY+LZfRbmkVVbbXjP4as28CXsyh0glKRXQ59+cihFudDDGZ+MLMragLgVI7lmOGToRgQOQ8U3nUZAlqDXxbTvNf8pGJ/DiUbJofcC6FJscBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704619; c=relaxed/simple;
	bh=hO+OoHLKKkox39ohtT28wGuGpm7pWF0RUNOC4LSXsiA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TMEquL0C+X5QK5flTJQCANQDUNh0VqLSv42hGmYw7YRXIbW5+IhYfOuqwQoRJhHex87S/upMHYDcfF1Pfj5mNlufd7YM2qrS/P/jtI/Fqd1Vgf3UtZzRtx0aFCJBQlw3i/Vj9XKy9n14IAqbE0+a6yPq9Zm+kxysioI9qgPtPRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mk3iF/0V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mk3iF/0V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3E31F000E9;
	Sun,  2 Aug 2026 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704617;
	bh=hO+OoHLKKkox39ohtT28wGuGpm7pWF0RUNOC4LSXsiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mk3iF/0V2wP2dTS/dGUtsohxq3Qm94B5zIhG/jyqkLi6fJnBtjwReUKoN5WAGVGK5
	 5kPS85XuVXVact/DCZFk5UDETc9y2C1NQ0PxAkrW9woMNvGjhnxa4c95dBfrpXTwNx
	 vzgkRFvDEVs2KYxXQJIgsZwy6FGPVbw9xnlimiQcWC9XpFB8PjmuegkxqAI9X7JBTL
	 QJBqDWSWAXrYqwEKu/X/O3BpDQOJGxXJ8eaayV/bvjAqMLC/ly6jms5b42rHCndj7n
	 fomgpNHbeVL8IUcraHW4yVYEfpRQOTt6RD0HD0r7KqbGLAe9ur/umpHZX+pzLhQIZq
	 n9a8hO1LyJsRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 12/12] ARM: dts: zte: Declare zx297520v3 CRM device
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: mfd@lists.linux.dev, olteanv@gmail.com, lee@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260802-zx29clk-v9-12-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-12-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 21:03:36 +0000
Message-Id: <20260802210337.3A3E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This makes use of the driver added in the previous patches. It wires up
> the uart clocks and resets and allows getting rid of the placeholder
> uartclk node.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D12

