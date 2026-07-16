Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B52330B2D;
	Thu, 16 Jul 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204655; cv=none; b=CPaSs8jUDWAxz7C5xvx2Im0zfA1pxBe46yjHSAkpkMChJJcC5VogfRchbjcXkBl4oVDhtRSyDoKEcTaVZjIDI3BE04fIyywiY7hack5D5plyZlXZGPfliYv4V4JFWeZdAU1AleQE3JtOHwQEAknY4z1rrdpbuvcetgp6QRMUGAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204655; c=relaxed/simple;
	bh=4QdE5MJ3dKWMJnXVWguBaKFyJ6UNjkWHahjOLLra/A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/Vffx23rcChYyOmxeKYvg8G7wWYZ7oLXvC+T0MgUAsVU8pg4lxuO48qiijxpcS6/ldFYOPwKXF1NEYvRz7BYc4ugRZtWAJJQceB0CdgprZl5EdTUJKNQvlqCNFj0F2cR3LyerqGVWAgs1W13RhvE0FH3b6gurE/aKK3KEuMMD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoYHvv9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoYHvv9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC81D1F000E9;
	Thu, 16 Jul 2026 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784204653;
	bh=PbSeomxFR9wJbrGm5B/wd1YzWmOMC3gsFPeiu91mm8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HoYHvv9u8kYzlaamNYAxBRsSxnqaAG3IO/bpoHqbUV6mJtKcx4cy6taLl2WlwCrMI
	 AmuQrpKszyVNT/7cVvFktrcd5FBerqv+H0fuSAzBTy42xsweBaxvLatyPCKzeR03Rm
	 FU7SIOkHyeDqA7EJ70TL4LLwFMD78rs+3w0fNEHUoUs0H5+gH0HSrgVlw6vdeUDlrh
	 Jgr1hREGLJfJlMSMNbhG47EOhLCZezaUoY4Q5FXE14LhsQ6aje9Cd8MzWL4A9+EFjm
	 8cRCdsjomxYyvl0E+PZSX3QQ1QHiVZVPXUHsd3HDNoYvnZvFBI/nb4MD2LPlhjJsHe
	 ZfD+0vT2VuwBA==
Date: Thu, 16 Jul 2026 13:24:10 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: rave-sp: validate received frame lengths
Message-ID: <20260716122410.GD1260374@google.com>
References: <20260706092337.78754-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706092337.78754-1-pengpeng@iscas.ac.cn>

On Mon, 06 Jul 2026, Pengpeng Hou wrote:

> The RAVE SP receive path derives event, reply and checksum
> fields from variable-length frames.
> 
> Validate event and reply minimum lengths before reading their fixed
> fields, and derive the checksum payload pointer only after checking the
> frame length.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/mfd/rave-sp.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
> index c1b78d127a26..0057fbfa1abf 100644
> --- a/drivers/mfd/rave-sp.c
> +++ b/drivers/mfd/rave-sp.c
> @@ -388,10 +388,15 @@ EXPORT_SYMBOL_GPL(rave_sp_exec);
>  static void rave_sp_receive_event(struct rave_sp *sp,
>  				  const unsigned char *data, size_t length)
>  {
> -	u8 cmd[] = {
> -		[0] = rave_sp_reply_code(data[0]),
> -		[1] = data[1],
> -	};
> +	u8 cmd[2];
> +
> +	if (length < 3) {

What's in data[2]?

> +		dev_warn(&sp->serdev->dev, "Dropping short event\n");
> +		return;
> +	}
> +
> +	cmd[0] = rave_sp_reply_code(data[0]);
> +	cmd[1] = data[1];

Come to think of it, what's in 0 and 1 as well?  Defines?

>  	rave_sp_write(sp, cmd, sizeof(cmd));
>  
> @@ -405,8 +410,14 @@ static void rave_sp_receive_reply(struct rave_sp *sp,
>  {
>  	struct device *dev = &sp->serdev->dev;
>  	struct rave_sp_reply *reply;
> -	const  size_t payload_length = length - 2;
> +	size_t payload_length;
>  
> +	if (length < 2) {
> +		dev_warn(dev, "Dropping short reply\n");
> +		return;
> +	}
> +
> +	payload_length = length - 2;
>  	mutex_lock(&sp->reply_lock);
>  	reply = sp->reply;
>  
> @@ -439,10 +450,10 @@ static void rave_sp_receive_frame(struct rave_sp *sp,
>  				  size_t length)
>  {
>  	const size_t checksum_length = sp->variant->checksum->length;
> -	const size_t payload_length  = length - checksum_length;
> -	const u8 *crc_reported       = &data[payload_length];
>  	struct device *dev           = &sp->serdev->dev;
>  	u8 crc_calculated[RAVE_SP_CHECKSUM_SIZE];
> +	size_t payload_length;
> +	const u8 *crc_reported;
>  
>  	if (unlikely(checksum_length > sizeof(crc_calculated))) {
>  		dev_warn(dev, "Checksum too long, dropping\n");
> -- 
> 2.43.0
> 

-- 
Lee Jones
