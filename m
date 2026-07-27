Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4425CC79;
	Mon, 27 Jul 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785177418; cv=none; b=ozZYN/1n5/HFCq5JNVu5ZR956YYq+LxKpiIBEXo+Y9Jpd8TsKx7Z0n+fn8bqWpjgyAGfvS49o4ETaaR37FqFgZSI+4RLyCwOahnh2r/TiarLo/n7qRYXt4gDl68XTJ9BN3Itrehga6U8KQcr6jUfwKiIFFa/sdPRLc+msJnQ1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785177418; c=relaxed/simple;
	bh=KN6QbkqC8P+68lAQ9m8oLFyZUDNU1UlGAtqP8ZS90Yg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ISwtVSj0rryW2gpaYH236ZCBKk4nz/gMOgwqTvwigSRX0Fv9w02lIMcxWxA/dTN8XA8h5n3naY+eFAXLDUpp8p5fJRgoG3fUjJMCytuhD5JRya5W+cZdf3AnyOau0mCyY8vNFFuTEKZS9aUteb5lJ6eXph/pHJ8GAdneXP83GZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuNhhsgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuNhhsgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C781F000E9;
	Mon, 27 Jul 2026 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785177417;
	bh=KN6QbkqC8P+68lAQ9m8oLFyZUDNU1UlGAtqP8ZS90Yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kuNhhsgGIefK2lN/ZBrB3TaWUGBgGgy1cNo85PWEi1QRmVo4F46el9PfX4P3dUKS9
	 /TZDtLP7aoYjNS2xGNtCCq+yMVCntJhNjxZ2RQDZGGndWGXQvzdl2l5aX9AK+nDzvN
	 OWMmF1ga+TD+lfiuAzZbe6gTbdlROSDqweBFkS8MHcnVzqrNzABi2xEQm5puhrSR3f
	 VvF2m+7vQLf/0HgnFRDhkVmHTrHP2SKEf44H1I1sZe2BTOK4VAdmrkIFm/R61FN6cG
	 oV42A6NJ3cuonjrplxSBuIVBGadulvRkOHdyMSQbpL/UW+agD43gf6Q0E9Ydk7k5fW
	 hyEXw+wzvfhgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-zx29clk-v8-3-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-3-7a107b00f1dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:36:56 +0000
Message-Id: <20260727183656.A7C781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are, however, a few more registers that
> are likely extra dividers for TDM and I2S devices.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-zx29clk-v8=
-0-7a107b00f1dd@gmail.com?part=3D3

