Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702246;
	b=w5Z8B8dfYNUhZZW8aVqqSdYwNA7LjjDWFhHXk9pb16V0p1r6Ody3yU8nehjPtp4ONBXv
	 x6gjrmrMRIed1T3Ec2nofdAC78Z5JAM4sWVNkhgDgXRhMtTG+smQQo2f/wrDivMysmkbS
	 V4Ezb+LkbJpLnZaIjN2w9Pm/B89jGSM0W0Oz02JwOvObD/6mqE3nPH52u+ffj5Sb3v8hM
	 30OaUbVS9ptE60LzUjzD+FAGAOEEBVp/dRhkSVsRN5UFiPU+kqkOVLax7fcbhdpmV6qzV
	 ME04p9B7QkfZeWmWW4bqoEABPxZopTm3oi8YUKOR2uoNYk++eKuoJi2zAB8WAeHoTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702246;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=53osGf62Yx2AtbGkUSFklmgXAMpmkR0XvQtxDAlzep4=;
	b=X+4e2+lmDTuJFJHh0oTjl7B5MAQqOwNVlkXdZDbBBsLZ7n2vxuf36YLYibuioMRGTlVg
	 R6Ve1iafTFSuF2EEvARIPQwWfslX6ApW0pqI38Pjqdw7Qg6L2pzVlBeOspgpV2UbHSlIG
	 bZDU195ucg4409+ww8fS94S59H2N2NXj+wEXaX2l2KdFN65BjbuDSnwafCmClwj0rvVof
	 uaedmGOwJs0YKTV7TPMG8gc9b9oOxkyc/HoMmhSWcSaHhMD7iyB220p2eoce1xK3T+ZGI
	 FA5M7E+J6R0yVnXUnAms8cnmQqT9ydU5sMj2HQy0J4KCyToLTQe6CLY0czZxILNqowA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVdZdzsa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E9606A31C;
	Thu, 26 Nov 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVdZdzsa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D331F000F4;
	Thu, 26 Nov 2026 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795702246;
	bh=53osGf62Yx2AtbGkUSFklmgXAMpmkR0XvQtxDAlzep4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AVdZdzsaFeEvu96jQc0qQww/nJssQLemMk7aj21xQMv1MMosx1Oy0r+DxrRj4b1b4
	 Xvs+YpQl04YJWyvDMB90yhyHx1KTgw4NSYS4q8vtaNPTmpUJQazoLOvS0eOUPfS/59
	 1bHI2vmk4vjwunItMdd4wAsu+JRjMTxyqPOnQiRN9Q5fQWstpAqV1HcKIPMcuJIuZP
	 oIJ6JELUVtmWnGrCj1UDRN/QHvy8Nh2OhGajgzHlfNFZwzqa6+rBc++JiNHcdTnDK8
	 hbzQxYSO5U7aJnndK+AqiKyy0AduhnQSsHDUUTezfWyjR+GLTspteI9/+Wu5YCz7JF
	 sr9Vec+f3DpgQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261117-dtbs-qcom-v2-1-c0697a0bf016@kernel.org>
References: <20261117-dtbs-qcom-v2-1-c0697a0bf016@kernel.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: mfd: syscon: Add MSM8996
 SAW3 registers
Message-Id: <179570224397.82366.8009907041644853561.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:10:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 17 Nov 2026 11:10:42 -0600, Rob Herring (Arm) wrote:
> Add a compatible for the MSM8996 SAW3 register bank referenced
> through qcom,saw-reg properties. The name is based on the label in .dts
> files.

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add MSM8996 SAW3 registers
      commit: b081c7a7044412fd7e41e88a520d790b349eae1b

--
Lee Jones [李琼斯]

