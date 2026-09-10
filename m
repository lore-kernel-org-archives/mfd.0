Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD34570F4;
	Thu, 10 Sep 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036846; cv=none; b=uSfocUhSYzEVNVAOUg/2QBr1tRW9dXT4mj2MTn3OvKvSVBrj0xoi4gpCcL/Jhto47xaYwXXq/OhhV3qB57l48QV8JVhYyNrMpfHYxy6BU2EOqG9f9t7QkDk4uOITe7DF2NHv25fEfYwDLGR8Hq05zWqQJMC5McnETsXnBpcyCO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036846; c=relaxed/simple;
	bh=U+Qyejdi7oMG30kRh4XpuQ9DWNqDtxoMoOV0E6oKga8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ke1zv77znevCSNfj0ulX8jukBcDm97UsdzyDI/z9RNn3U3nBTkMFEuvFPQYpoLtZyC/GQsnsSTTjmt5RSEz1YjvHrXoM32HWr7jO8Z+BdPs7JZpaiAP7USoO8FTK+j98NXEVxP0Tf2MGsCKTWwwh2FY0yDBr5VLGozXGZYvowJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVKyYrCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVKyYrCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6251F000FF;
	Thu, 10 Sep 2026 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036845;
	bh=kUjMBaKPwMAWmPyiQrZjenHw3IEOxvu7Zu+P9rGEhIw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iVKyYrCUHtMTdFLc+1xqaQvBhKX0NEFfPIGvxMaSiWUMJvS0PwEv32TJQOwql3pbN
	 OIpZi2CBe899OjIVh1R0lVU7+GGmOXls3ivpo5GAShxILr2RCrU+u2bTiUulBWbUyr
	 mcWcOvtXiFbXflkaEK5GB/83Q8qBF/S07qIAaT4v5m60wyLSkS4i+YVlJDqPc4BDlk
	 G+2it3bItrLd+K6yy5iUQWNp3h4guGee4k6DSFr6oZaoEng3a2T65Bu6n5jSmVaW54
	 KEEWXHsBtF6/DDKaOxv/q2imbff/iPkFOW9upW0GEvjl+Y+bmD3PtMQD+oiR8U6aog
	 jk8Ro4cNRgoKA==
From: Lee Jones <lee@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Axel Lin <axel.lin@ingics.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-8-fe88b01829bf@kernel.org>
Subject: Re: (subset) [PATCH v2 08/13] dt-bindings: mfd: ab8500: Add
 regulators
Message-Id: <178903684262.1027854.13896932519291014595.b4-ty@b4>
Date: Thu, 10 Sep 2026 11:40:42 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 01 Sep 2026 22:02:13 +0200, Linus Walleij wrote:
> The buck converters were not initially added to the device tree or
> drivers as they are mostly always-on, but their outputs supply devices
> which need to reference the correct regulator.
> 
> Describe the six AB8500 buck converters when the regulator node uses
> "stericsson,ab8500-regulator". Describe the AB8505 converters under
> their native VSMPSA, VSMPSB, VSAFE, VARM, VSMPSC and VSMPSM names when
> the node uses "stericsson,ab8505-regulator".
> 
> [...]

Applied, thanks!

[08/13] dt-bindings: mfd: ab8500: Add regulators
        commit: a02f846177305ebff7938291926c8d891624e14c

--
Lee Jones [李琼斯]

