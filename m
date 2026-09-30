Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC44DDB3C;
	Wed, 30 Sep 2026 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772969; cv=none; b=taT/mstKKLDdS7IF/opzYNPd5uA5mRJ7HKM82ZBnwnBw2hygilZB5uZ+ZQSRNHRahlDAQTbhapWtSOexFfVo1Apx3AGTqN8k0YxC9pAIUJe+1JI1G5oRWBgPIjVfwFaOEOumG080odFsixFwr3/84SRr9/al97/OUjoK6nT+P3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772969; c=relaxed/simple;
	bh=e4KA02SY9uA4AmiZeMU/D8yrB7LUoIXWpN4/ImnSdd8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XA/9kaWJSzWmQxRUgZ0mrIaWOY5eA2QlNKZ9oi52yLaq3fJlE92MNf6JgsX8glLQ+3FD/ctZJtmVOxsebTuyAEC9dKeHr/EuGiSb9YuVvI5BewuhP/8Rp+EUcSE92OGD0hQA2iWqwgvafdfaEO6dOZj+uXp8KPe7VrL9GrsMVX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2tEPNeo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2tEPNeo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD5F1F000FF;
	Wed, 30 Sep 2026 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790772963;
	bh=e4KA02SY9uA4AmiZeMU/D8yrB7LUoIXWpN4/ImnSdd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W2tEPNeonhh8lrNtaeZGbOnfJPsL0nwkpBW2qbXGfR/td5YSYXtGZkeT9WtIY2Lf/
	 jLnqNvKBvJliBhA/3AEaDwvHTQVtSvbB1SPoH3zO1hpCu2+Ua5MsxQ6N0cw/sDgFi4
	 22qSHRRLV3asNNfiv7UD0DKr2kZPyeFJmuTLWphhIJ6/ImWFr7h8lWUIylkMHgNC5I
	 6EhnCb/f53TQh5TNkOE/9d3EGMcb5VSGOVpFihU+UdVYgjWJ0voI2XbSf42pnElfiO
	 7qJ8iiNZp9mLi/dPhAsOi8G0/5O84GSjVDtfIkdfiyalzQDII5USRg291GoSyilQOG
	 wfjSK9jwETLfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: agatti: add LPASS devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930124607.1109167-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:56:02 +0000
Message-Id: <20260930125603.4DD5F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Alexey Klimov <alexey.klimov@linaro.org>
>=20
> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock
> controllers are required to support audio playback and
> audio capture on sm6115 and its derivatives.
>=20
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930124607.1109=
167-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2

