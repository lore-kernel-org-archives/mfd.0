Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297804137B5;
	Thu, 23 Jul 2026 15:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822008; cv=none; b=TdHKwlToCFZLtQoRreYZkHt+MSptaDY9YlhZd20i+vR79Oeqp/XTIkP5MuRKAIGVOVYbqt7LfZKdv8pnSwVQLKHyXBfN2Jwz9BlTo13g4ueDmw5V5v2nvfaCbskVTcGWeCVhkoY06NyV+EOWZyAVEx9QH0tt1+r+Pw9iNcG/rzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822008; c=relaxed/simple;
	bh=c8Kd1KeL07wmOVr/x1G+XhQFfWvEv5gxQ/tRYEQMjk0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o5EtmQ0Uk9amYnnOnFWRM504vgJOzCFl5DHNYNS2akMBEyzsHCyluBwK/F+OiSzr9FQNIytyuwARc9KbhT1+qVf8e4Bi4FcHEga84U3SskwnSZLhP12c14Rt1xcGlpof0ploPODHU/RU6LLQV2/Y6rTV1u7EV4WZphr7fjmHc1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ex7E0q7E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ex7E0q7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF06C1F000E9;
	Thu, 23 Jul 2026 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822006;
	bh=HO4DJak0tRVus5PdXLrieMrz/kKmMU1/AkglQrbY25o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ex7E0q7ExaSluRy8TAARdKgugLHh9SrmwoBove0vAxbiaFF7bKQ6TdjZNZON71fYm
	 8DnNpQmQWVP0c7TdhUPEF2rYlKiOHPaWUAzgXSUSe9B3OO38MOAIe7Y1hLpaV8Y6zT
	 Y9WoVP8Z+KlJ7SJpSM4z8ZUIPLLakY/7DvkibfCkprguLfK8Jh2e6gGcpGdxOgnv30
	 tBUUiI8Ri5OGKA2W8EOi0O+MAGjDSp5CBNM7zix4alPiVs1C6HSX2p2d/7+BFI6kB8
	 RZtU0oq3lDZubcuFWV1tHuTBUwcW8M6P5YHS7gHN5wMQRrjl2Ht17XBNHu5c535CPs
	 c+JFsu+HYLcJQ==
From: Lee Jones <lee@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
 m-chawdhry@ti.com
In-Reply-To: <20260708123328.1768794-1-egbostina@gmail.com>
References: <20260708123328.1768794-1-egbostina@gmail.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Convert OMAP USB TLL to DT
 schema
Message-Id: <178482200364.3523234.5674686731620145841.b4-ty@b4>
Date: Thu, 23 Jul 2026 16:53:23 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 08 Jul 2026 12:33:28 +0000, Eduard Bostina wrote:
> Convert the OMAP HS USB Host TLL bindings to DT schema.
> 
> During the conversion, ti,hwmods has been made optional to resolve
> dtbs_check warnings. Modern OMAP platforms do not require this
> property, but it is still required for older platforms.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: Convert OMAP USB TLL to DT schema
      commit: dcf9d779d4f0d3c52f2949a6bb7cfb5de144c323

--
Lee Jones [李琼斯]

