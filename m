Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731C39CCF3;
	Mon, 10 Aug 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345857; cv=none; b=s13eSfJ+4wWMkhP7CT1ag9tdx6PiDhnxKRyab51Xa+aVmff7CASEK9PnPFROuMVKxVOBe9CQ2EG+HTOBF/w7i/bNaiFNjHd47NcY/vZ1Sbt1iwetEftA9rU3+MuUJAPCpPAPzp9caRFXr93HQbzLEuX6qKVmyb+6AS9ZoTRzn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345857; c=relaxed/simple;
	bh=y8BfWpXNpB/ChGe4Ypl83WuwqWbR5zEcrx4/LX/BJN8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OEXPI4DMUpij8Fsmbt0fk3hxVgc1cPd6iAcMyliCzA7O9c+JfKaq2p5QlCXkAZN0ivmqHvcYuhou6SnPqZx09CJVROyXs2O2KiRf9sZncAEbzuY0K3PL0A05G2Pjlvdwz00Y962Anc20waoSocLEuubdv05uq2DGLWTRzEVMqCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScaIiwnV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScaIiwnV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5ED1F00A3A;
	Mon, 10 Aug 2026 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786345856;
	bh=y8BfWpXNpB/ChGe4Ypl83WuwqWbR5zEcrx4/LX/BJN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScaIiwnVXkv+gJCEX/+zg/ZPlBeMwGYWagpO5ptOH1qbApYKkb9KmDYJ4rSIbOj9h
	 AmvLHqlRRc3hxFlG+SSxAwBYjPEg9jz5g5iL1kn6oWNAQ1U8zhq6RkHvfIUD3ew4Ln
	 kxspEsgenfDL/oLj7DFGii4uTKBWgeCHFs/PGJSmDOPPY+vIKQWSTVGHbcmL8kiX3J
	 k5yVZlqs76Qsl/OOUcaNtGs33Ord7f9noS08uWKR+aaGeyRuI2xGZd8nnorT0Ew/Hj
	 HlIfOpVWEgoEDVr3r7cY3nVK+CunwmZwVOcRejWX7JzVAoY12rU0aY4CJjG9sxcNpn
	 Hv67UoAOTavHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 06/12] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260810-zx29clk-v10-6-63846490712c@gmail.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-6-63846490712c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:10:55 +0000
Message-Id: <20260810071055.6D5ED1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-zx29clk-v1=
0-0-63846490712c@gmail.com?part=3D6

