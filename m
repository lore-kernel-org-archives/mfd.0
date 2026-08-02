Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B931326A;
	Sun,  2 Aug 2026 20:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704364; cv=none; b=a2NYjJF5ZY5yBM0sO+DogVjeBlDVMH6rY7RB1AbhT/b+HYt/wwCHnpEthABeUxXhofb4pXbJjuBjBfQVCts4XFXJTgZGDnlIiRvuOJzQcgXRzlJwZDOH0ykm5GJyDVYCP7RDK39T/Kg0IzHQqLkv0nb4uwnZIDBlJNn+MWkXSiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704364; c=relaxed/simple;
	bh=tLhe6NREIwjUModbpD3CsNyDmKnFvMNpUw+OMwsi7w8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tYEaSj6O5GDQcDOFA77kajdsW/UlcRVPZKSvRRZaKIgoADSBFOgYAzAje36idNgqQMCmue82UA1RuvRkaZwKey+ZMFsNWMsulJMFPaZuiZCtkjw6ZpXqooE5sXo5q/44HjsCBOc4FdQp3hdTOqXmJoRVO9bk4141FUTUsFQWVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpfCFeph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpfCFeph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554AA1F000E9;
	Sun,  2 Aug 2026 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704363;
	bh=tLhe6NREIwjUModbpD3CsNyDmKnFvMNpUw+OMwsi7w8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpfCFephWRgW8jaDnE9/VLKECYAPjTpg8BUNeUKnw4ZOo2cnOYZW+/1mgNInzAhQA
	 TZdBySx1catRmpIk2c+jJVmxe2k/p2RFi+Tmv02hFwAdsfuMvVkgHpSnuQjPanNjJ2
	 pCHN0w51Mmaerws4vHsp3iD35DazQMEoMaFmDnIy21XcuUe6SV52sTZIXuiLNu98DF
	 QMn7L/2EQvOywHTLXU/UOo9jiR5o4VuhVziJvvNwBmRyl15anCJWYFNku3/tQ44e2N
	 JORliBmS9cx7/tYPW9Me1fcgmt8oQyhI3cMtCSKTJRZ/FwCvstz0zqXbdfo/TsID/G
	 BML3SAfilgGUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, lee@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260802-zx29clk-v9-10-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-10-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:59:21 +0000
Message-Id: <20260802205922.554AA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
>=20
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D10

