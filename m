Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F09369D68;
	Thu, 16 Jul 2026 11:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202034; cv=none; b=oUnSHx8V4+1LKM/tFYs4Bfw7wr3L1xltaOccGcWqy6gyQraQ1W6rLMyMmAZ7XeqCh+baoZBB5AgGHVoaoCQ5f7ncHWmqCuf9R94huH0BpxBILaU8K41SsfFLmHs9vZxC1b/Jpx70j7bT9mi41ENrHSB19XIpfuCD81B9pgdaaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202034; c=relaxed/simple;
	bh=21qJjfSM+0b/W1WwWPU82BFO8q5LJeKkkaJPDA+bX4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6YBullkl4V96vmScUQoAe/Frpa/VWsksUeet+G4EesuGSI+pRUnx4y/5TonoMcJFz3dwZbVazQC7BtmAg/weeMSrJrBTColJ+w0783zqVs1IUQb+Gq0HAKUusuHDPE2fauky/dU3EeTBYTyq7IbyDn6hTzyc+xAAVhVJ03E94M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFCbKjOM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFCbKjOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7592C1F000E9;
	Thu, 16 Jul 2026 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784202033;
	bh=zILxHwpx7/IXoRPuDxJbKxJc2bTZRyBViFZJSlFKMq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFCbKjOMFBSwHq9QqWJ94Jk+do46aRj3Zr8CLvx6Tc3cGe/PIH0JkC83Cvsl7XIt1
	 81F10MuVmBUm5SZkBQ2v87dDj+BFAzbS8pBCPuvannpsroHTEIZtCxAxjw3EFwJkgx
	 GgqKEPcfXCy0GZr1NkerD8GuH3w/pLq1oanFriXmT3lvWTKw0fXnZlOD87pEUvolRd
	 WJ9ZaOlJ8E+rGS5CMgeKzUfsmExbFoFNgOEwTfpWyc96WN9D8d7Lhwd+J+T2Hd4CP7
	 vJMvJjkLWY1Fp08PUmO3vL2m5XJCjoeZpa7b9d5Yfe3KfseHZfCpcaR//OAxfndvfX
	 YaK7HbgNDJm2A==
Date: Thu, 16 Jul 2026 12:40:29 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: iqs62x: reject zero-length firmware records
Message-ID: <20260716114029.GC1260374@google.com>
References: <20260706091034.75865-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706091034.75865-1-pengpeng@iscas.ac.cn>

On Mon, 06 Jul 2026, Pengpeng Hou wrote:

> From: Pengpeng <pengpeng@iscas.ac.cn>
> 
> The IQS62x firmware parser treats the first data byte as part of
> struct iqs62x_fw_rec and advances by len - 1 after the fixed record
> header. A zero length record would underflow that arithmetic and leave
> later type-specific reads without a valid current record payload.
> 
> Reject zero-length records and compare the declared tail length against
> the remaining firmware bytes without open-coded subtraction on the
> cursor.
> 
> Signed-off-by: Pengpeng <pengpeng@iscas.ac.cn>

Nit: Your Author and Signed-off-by tags should use your full name.

> ---
>  drivers/mfd/iqs62x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
> index ee017617d1d1..412ae7777f72 100644
> --- a/drivers/mfd/iqs62x.c
> +++ b/drivers/mfd/iqs62x.c
> @@ -237,7 +237,7 @@ static int iqs62x_firmware_parse(struct iqs62x_core *iqs62x,
>  		fw_rec = (struct iqs62x_fw_rec *)(fw->data + pos);
>  		pos += sizeof(*fw_rec);
>  
> -		if (pos + fw_rec->len - 1 > fw->size) {
> +		if (!fw_rec->len || fw_rec->len - 1 > fw->size - pos) {
>  			ret = -EINVAL;
>  			break;
>  		}
> -- 
> 2.43.0
> 

-- 
Lee Jones
