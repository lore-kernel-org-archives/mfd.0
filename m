Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E398259498;
	Sun,  2 Aug 2026 20:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785703967; cv=none; b=VUgD1J0aMqyZSyHIArjc18ZDwxjlSPF1YTU1ni2o3gvW6QbYXSN8QUufVt4Iy9UAYiUVtnHS1Cur6vVFV4E79XApXrmuni0tapmM0IQh109+7jHBLhwSlA5r3RWpvmYHjmdcL5qpMPXFyML9A+bzkyc6b7aqNUq96ZRoBZkggNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785703967; c=relaxed/simple;
	bh=4BeU+Qx3FYCVI8MVXzLdPjmc5RDQuvcsHe7P25KBBHk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PlPTPnvZZSnSXgeYJ9abroFbpntGUnpFR5CjEKyzOLLw8HdGSa8N9x+fbvepLnMeyVVd03V3g8BVO1bg0mLr+eDY1IR/2jDP3q0g7vhWtw15OE9IGQ+8rdTG+xgcBt9HbH+7rFlxoKe0h66+YJrzRbwdOrI9Yw2bCf75adJloj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBT+FwWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBT+FwWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DFF1F000E9;
	Sun,  2 Aug 2026 20:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785703966;
	bh=4BeU+Qx3FYCVI8MVXzLdPjmc5RDQuvcsHe7P25KBBHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SBT+FwWGq7FhZWni5P8TB3fx9IbN+f09FN2BB6WkCRpGSAR5l+HXLsA5aXzw5lkSL
	 DMIKuEXCApkvxqdt66HfSL7qcJVQvfHkF9+02B2enf0XGuafVkjJOF/nxIx5ZFkCDL
	 G85xWcLwl3EmBbqG4jRH2bcz6r0LyuXgsE0WjdgW8tYn5z23ePiDg6+cdeqGk59Kg9
	 KFDYc2AQod6YFyh4+FFsZpq5UNljFVaoZSKNoIBNGjvdktwGz1zHxWqQvhzuBrLY0x
	 sMJOA80u9B08zWLqq50B5SayhEx7SQnLIT6W2HjCcAnIZhgUvOFw5bm4mlptLWBr3U
	 Z+H6punjUkA3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 07/12] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 20:52:45 +0000
Message-Id: <20260802205245.95DFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> I am guessing how much of this is reusable among other zx chips or even
> differently named ZTE platforms (if there are any). From reading the old
> zx2967 code, I think the PLL code would be reusable there, maybe with
> platform-specific bitmasks but otherwise the same logic.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-zx29clk-v9=
-0-d05530d85d28@gmail.com?part=3D7

