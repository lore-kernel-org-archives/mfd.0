Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5065489897;
	Wed,  9 Sep 2026 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966823; cv=none; b=gsGrz71I6WjinmPd8/r5Cdnf1+c/OniKA051g4gZdlblub9LxKO2TlHcjCvBshyGYbMxsir2yNie+0WlLjvV1qmqPrk6BOmVlkUZKh/1Om/fPVjNKEBVNxgt4+6aGMJ09jGiX5JoctVsLNzrTSV9RkUOWDsSmGeD/HLVTxH7Ego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966823; c=relaxed/simple;
	bh=laODArpHD7hJ5nZFGu/uefw+aY34FW4pX1wpxiGkHzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4HwNQKwHui5fDNm2M/Cjo7/8K+PNSmwMRUQaG5GrywHRZakQiaZE+TLMsqv+sWIDPYIEOHD4DFfQOVYlKToueqxrtaXm/R9RjG6Ks6VqbaPfkdhngs4BcZ8eT3LSJLaKDUI/2G1WvTTELn58smg0zH1LfZfdh1u1sygpTnWK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Br9njwCk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Br9njwCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5DA1F00A3A;
	Wed,  9 Sep 2026 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966822;
	bh=nJcrh9JEinHMCgGEO7t8lXSXFKHEPWcMg70GS9PZibY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Br9njwCkZta5D7//9pt0BfVfuYXsixJ5Dvdhe+WAWsf+ToTRj9Cvr96PLb/IzYXLe
	 vC18qW2IAJbPLH4V5YgewO6h/g2lNhwos2egF6BdeAGIWEk2+O3uPoL+F1+Zss/cVM
	 U2f9q0sTp9i/mdZHZL14Y7wQ3tduoLqDX+MS/yHavxG619REPqhi3QJF/XThsFkqH9
	 Tj9qlO8kSCAJOrhTR7vbDWcd8aCU8bgv1l6PnJ32u9TEiwxjk9K6EgGe7t/STMbgS5
	 AZVq2RhK2YtzYanXAvrKYBBqt7ARml8d/P8/yIMldiIw4TA399ZRAdHrx3LfgBOsSu
	 1it5iM5RfVAow==
Date: Wed, 9 Sep 2026 16:13:36 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add regulators
Message-ID: <20260909151336.GB2133376@google.com>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
 <CAD++jLmFm=BwwYAW4Wmumb53CJeFYzwEAMmcz3OKa2umcR4rQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLmFm=BwwYAW4Wmumb53CJeFYzwEAMmcz3OKa2umcR4rQQ@mail.gmail.com>

On Wed, 09 Sep 2026, Linus Walleij wrote:

> Lee do you think you could ACK this patch so Mark can apply these
> changes?
> 
> Technically maybe it's mostly regulator stuff and DT binding stuff,
> but it'd be nice to have the MFD maintainers blessing.

Or I could just apply it, like normal?

-- 
Lee Jones
