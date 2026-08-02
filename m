Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03489489893;
	Sun,  2 Aug 2026 20:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785704151; cv=none; b=hf4N3GqD8TxUdtxXhVhBjlhicjzOf2D0qsicgJF5YVEnacKNFi5OZbkJ4qhB9CgoJ/8KFF9whNDYJluSVrkHho8uwtVzZ+ozNCz3MNSHU9Bbtqn4ZSd+61yuD0M/Zpsf8OCRpG5CUgxuBghKzJbfEdUY2VXxYRRHtWSiiIcDmoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785704151; c=relaxed/simple;
	bh=DRCsIR+zvzV9s5xwWfEH9XgyYWXoExxf3iL+j/NQBbE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WO/2/oZt2IC12l698frvekeS5ABsz4ReOVaYoJVUVjFyeSeIsLZ1fIgOifuN8wjfUCqXBnA2gM7Tx1huz6MqBlLYC54hLOBrtvGmO8rp2AkwFq83qm46xXeP6Cwy5jvD7rQ0bjEtlRk0XDV9lA0FlopMxXU7VpIM33fXT0vNgVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmxQMbex; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmxQMbex"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B331F000E9;
	Sun,  2 Aug 2026 20:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785704149;
	bh=DRCsIR+zvzV9s5xwWfEH9XgyYWXoExxf3iL+j/NQBbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fmxQMbexQydDhNpL4JqeBcsfrEfPqPZUGnWUwedbStKosM6wl5r/mvVpPS1S0tvH7
	 plaDAe6x/RpydTWhhDgxNN5L7Z69D22BTwB4Gg5IXhFdfNRsEvLbO73fTPbyC1MV6n
	 wQokv7S4xWPkKAm85Oj5dzHOswqDKkmdQ4cJ/rZSonTX4yimyD4bw6G2dyubd6hF5U
	 kLV3o7HtzHao0nZ5v0dp6gVDYpoJDJR7CGrE+sNHAidE1GCv4Tp4zpmdXBbcT9b6hR
	 HPjwng4JJpXj/jy/8SpmwEdCi+SJgyR9DW7YhwkfERMOBDF6N/qgXFQ74XrbFpyaDF
	 EgyjHF5BHrCFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, lee@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:55:48 +0000
Message-Id: <20260802205549.57B331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D6

