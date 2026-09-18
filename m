Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC43344DB9
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 08:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719939; cv=none; b=s353/yjoLzhrHTyn9nQphs3lTSE3/szZl+Jb+Qj/2uGCOq6d3xYhmhVxf7JRvLtM787fJ1bSXU1LhfE78RfdXTNfHddWpGUeMreg7dLbOTzuVl+hsuAyIaDH5YtaVDhGuavG+dYuqm+10tUMUqJJCsIbW4MKa1QsgMDgGmsIL/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719939; c=relaxed/simple;
	bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nwLdYnGxk9knc3FagEDugO19fWeqOmta0M86Eef49KRejnF/hYTRzwIKSbb3AnCILrzgwFz+EHtplvPnICU9XnyIQMEQCt7Wkc2Pkv/PjgO1iYhyMeGhjDiPNMUxoa7V5HxkBv9CSEYjRGpEQKmHDT7CPcOZclZaYxNqOMHlQRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUgObOut; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUgObOut"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso678274a12.1
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789719936; x=1790324736; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=AUgObOutRoN9eCI1tj4ucKNilLuhilsz7ur3yQUHxm/zO8KbAM5MaqR/xcHjBKYul7
         HLEf/C+3oWlxb2UhEWqs2wD5Z9xw1iPT+9nn0CXM3PLy9at1RaafiuxM8ajem+Zhe1xr
         T4VslL822WD5j0lrDL9ss5yW1ywD8ohxw5KRsoFYOPhMGefCEGxI9h/WMxwH7gw74uFD
         8xFawIkYnOxXa0z2ckluogd3ChkW161XOAd9NVFnUXCbC8PjBpMN98ofjPn5uqg1+atu
         26AwlNvz2KKMhTdKitSXLzNDPKmBrz+G0wefRpsHj2G8aoJvH5tDNhVpQ54ZBTAqWl3j
         dPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719936; x=1790324736;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooDqp28BSX8C4SXyppIAKvDz7sucljsaMY9GFgwSBFQ=;
        b=MaQGSfRcLRurvkGyuFhkKJYzhfdQJZ898fKaBDgUxc4OSlgRVRDZqq5/2ajvCG7sWf
         EqgG6jm+Fy1ymyu6q5ZVk6xd/Zc5gHP63ayt9s+2RND8Z0d3vYaIvDer5yqgIlO/mKZh
         fvo2w5ISee3RFq446X0nb6M/QLqUDnpJqw9CoDjIPjtqEV4WlI9T0pXyVBi1VUyGteLg
         4IceaRSyf3FN4e4axJ6kTe3WLeUNM6Kmb9+fx1S9fi09iDUrtJnRFLD0x/5nBgie1P8P
         vsUvtICmleaSyGrgPGE4s+mrmHjK0HfIavMpo5nm/MD2dW96KbeHN2bUrqLFltzMCcz8
         iLkw==
X-Forwarded-Encrypted: i=1; AKwUvBzSIkr1DmjRJPzr0pDX+iCSGV5exvzulLUXRzZsimUju1+qS4R8MMUnuyj81c9blgAmSJ0=@lists.linux.dev
X-Gm-Message-State: AFuF++kZg802KWMcHzHzQrZ507z2b/a6dMltPDcbqB7tZDr27kXKxdh0
	VzA/cxZhtJxLNpO+zsTDWmcXq+JrCZ8m6SwK2zJP8FDEmTsTplvPDdsKfPaVtJeCpP8=
X-Gm-Gg: AYBFou2AS+S79Hw5ZKbqnEPCA6Ti/Oyy/nMSPXpYnrO2wCLE7T9GQi6OAIrCU0ZqSB5
	hUcdqz90xIYq0+u5dnbAMVFXrXQDI/8UGR8ygrJM6ucFVzcw7FVX1B9hZ/NS3Gp4R21olNCDg1C
	nB1uDC4NWRFWLzNnlk1Q4hKGl0qVY6bFnlzdbKPIP8pBEGBhXEZEM/TIGZJvGVmLRKjSD/y38ea
	IQzhVtILBkHmezCm9I5W7v5nNAQzuKFlxvEJKHkZkRSQ5Bidh0y/JC6lO4YGjhGu/LhpEZuVmuw
	U3JsBXkXAUTpIQqZGjzm+QsJVn8NuhVyqq/SJMmaQvjwllwi/9YM1I01ZqVHsWMuiaamXEZm1rz
	OVRWw90lMAJrI6WzSCcjThm4V+wob+ZW0Czfpb3/ILjm17vUlMNbCHQ/EHk4fmqE9jomat4kXEI
	MymMK45/fH08iDb8AMvsESFVjNi0eU9YEVEybZqKwlRvwzqy8FRbkXwl52buOhji09yN8GbmxYP
	dU=
X-Received: by 2002:a17:907:c318:b0:c29:5326:5a63 with SMTP id a640c23a62f3a-c2a159adca8mr151942066b.16.1789719936083;
        Fri, 18 Sep 2026 01:25:36 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb0715esm31148966b.20.2026.09.18.01.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:25:35 -0700 (PDT)
Message-ID: <45086d36bd16a3475f43be03f34b9d712ec8bff9.camel@linaro.org>
Subject: Re: [PATCH v5] mfd: Fix typos in comments
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Hemanth Selam <hemanth.selam@gmail.com>, Lee Jones <lee@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Botsz HUANG
 <huang.botsz@gmail.com>,  Nick Huang <sef1548@gmail.com>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Date: Fri, 18 Sep 2026 09:26:59 +0100
In-Reply-To: <20260917054045.15805-1-hemanth.selam@gmail.com>
References: <20260917054045.15805-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2026-09-17 at 11:10 +0530, Hemanth Selam wrote:
> Fix misspellings in comments across the MFD drivers and headers, found
> with scripts/checkpatch.pl using the list in scripts/spelling.txt.
>=20
> Only touches comments, no code changes.
>=20
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
