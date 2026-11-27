Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772881;
	b=WW3QTPA5m3AdMblZWUDrVDg3F7m7ICDUj8Jj3qjF0om4FJ/klsNm7xr7AENvSXGOH+5l
	 9tdKnA597/ZosC9HMCVJuWB9E2g1YZhhtQWbdPl8HJ2aQox0LPWwvb38xv1qaW02uJpM7
	 KkPhnuicDERXjq5XkvKoO4pLXORx6qaWFozLUJCeovUspqdigzWM09/Zv8gbZFFTZpFC8
	 PmaOT1sArRqDQvI9xAjMhmrySlh0O+78r9OoW9DQwgFg5kIrn8SCZjkT+m0c+wQMvfKJe
	 BR4EqbTxwyKcEYN9pQ3RS0Qg0X8DmBdbz5fXc1SVTyxq+FWexPVelye8l/jXNhF8Vbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772881;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UVjAewNoGwOkppiEbs+Ibor4Yut2pWAD/XmpYyTmPM4=;
	b=2q57/vxclYI7rDyE48t9ZiqxLZZdaxmtDyXnIWVOxbDuhe26fHyH3mpWf4FIt21wGAVs
	 ChkFc1K+FbrqCVVaj7HmVnP8+RZf3+q+0Xl68DHmVzdZMkDkwASEnWMQ0cdqjTy/5QN8Q
	 65PLnimlTh8pceBT3ePk6MvzI4+CTGjHL3FMowXZ5Du0O97/ltNHf6/OfLxTJf3YvxDsB
	 UU3RBdL5/xUcuyqmvEpC5XCJFFnRk9EbwVfekBlZ4mqvxFFFVkj5HtxvyFxF4XK2egQOB
	 RHgNb+wqA0hvM8VJnH3qoqeBk4XXPrdXhgIEr3avSY6SyDG36kTXNUjew3gVjIQCRfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkfCcEV6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22D8606A323;
	Fri, 27 Nov 2026 09:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AkfCcEV6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86CA1F0089A;
	Fri, 27 Nov 2026 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772880;
	bh=UVjAewNoGwOkppiEbs+Ibor4Yut2pWAD/XmpYyTmPM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkfCcEV6cL2DVhEal3gTid8+YIWmjJ6PhTbja6ykIHWLJn8tqKxNPevYbdY9HN15A
	 +qrvVsbzIp0usu3dX9fHLDdz8g6fBSUEe2h710kdzXupMoUEetf/Xb2BinIi3NE+Jn
	 MOLBbNsn6Del/cmII73bjJXPf+OrHV/C/W4As4gRMbGsMa9cOjLueGsUMkTnfAeajW
	 3CqUJqg5R+b9+w2juBZ0vVWDsfhCdVpRkYgyY5wv3gOFETARb6Rj4xKZydjJdq8Ct+
	 jtfvYk8jNY90EDn2OPRB9TEhpIZbUaEntDxNtPGx3yLEqp01PLaSGmBE3e6rpuGB1Y
	 GLcwitdKsc58g==
Date: Fri, 27 Nov 2026 09:47:56 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ab8500: Describe the ULP PLL supply
Message-ID: <20261127094756.GS38590@joneslee-macbookpro.roam.internal>
References: <20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org>

On Fri, 20 Nov 2026, Linus Walleij wrote:

> VintCore12 supplies the internal ULP clock PLL on the AB8500.
> Require the supply on its clock controller so the PLL can be powered
> while in use. The AB8505 does not have this dependency.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/mfd/stericsson,ab8500.yaml    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Needs a DT Ack.

-- 
Lee Jones
