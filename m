Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED2430CD9;
	Thu,  6 Aug 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017323; cv=none; b=jzuDr8673i3TyOC9yjv0a3tu0/WLzuJhSwLBDeuMicoCCGPJ7Zv2uod+O9bU31jUt0sDxnUy/08mEttA5T7YDIorHRzmfbRgTsUyTMjtS2mEqrQdcwXeKcvLV9X4xiHIlklWEiVIqEWZky1Fewc7Hm1f7kW0KcUN2qZ/JgYbEQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017323; c=relaxed/simple;
	bh=MfRsaJ0D36+3wl+aH1sfn6mDPy6oqRnB0C6d9lBJMQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KrY8uvkpZm+eIdXISa2AzVnSwukq3zicG+IFNR4FUBQrJlOykZdBtASbKENxwVYXNFyD3xN2pbOBTe7kBWOREfcoXs8LmT4LTdlfFO3Bxy0cdZ5nhGokLELAj6vlk+L7Cbb9a/5U+v7Mx5gVIlFZkd6xxmeY6i8L/mJEL8kb4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A906MbMw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A906MbMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B741F00A3A;
	Thu,  6 Aug 2026 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017322;
	bh=TeYl58IgZY5YhxRqQtXebjk4jYw9ICffcHLt5DOaFe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A906MbMwz4AL1oIMa23xXuKRZ8qBTs0qWkrOPWDiYhRKzmvMLHwD1ecFHewzgHnTT
	 lYob22JnrAuSuOZw9s5VGnpZ8dBRwbE0cN/1m6siAbkas56BgtlBPDQagnmcMtsDWA
	 k2r8cwuEVosWHPApg56soEfOybaEb3Wci6m7XD9klQLDmLf/qsdqYIndjTnnBnYFeo
	 Uh45etxu6vZh4tYN1065+n76aS0tdrNgfBHr6ER9cN7YH6OMm+dpfQ+VFl5nrlH0iG
	 6shIqsFSWWW4zHg0j6dXzPN4FsyMTum/oIcqdHBdVr0dgZO3KZLdN8Qw61pURwzoUU
	 3v3IENAJAIUHw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Mikhail Lukianchikov <avermoal@gmail.com>
Cc: linux-kernel@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260717121015.11666-2-avermoal@gmail.com>
References: <20260717121015.11666-2-avermoal@gmail.com>
Subject: Re: (subset) [PATCH v2] mfd: viperboard: fix native fields type in
 structures as little-endiand
Message-Id: <178601732097.2870495.11789481756490153336.b4-ty@b4>
Date: Thu, 06 Aug 2026 12:55:20 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 17 Jul 2026 18:10:16 +0600, Mikhail Lukianchikov wrote:
> Sparse reports several warnings about incorrect type in assignment
> (different base types) when building the i2c-viperboard.c driver:
> 
>   warning: incorrect type in assignment (different base types)
>      expected unsigned short [usertype] addr
>      got restricted __le16 [usertype]
> 
> [...]

Applied, thanks!

[1/1] mfd: viperboard: fix native fields type in structures as little-endiand
      commit: d97a98f434af98c1a46f5dc98b0f861187c52f63

--
Lee Jones [李琼斯]

